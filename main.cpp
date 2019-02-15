#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <iostream>

// mongocxx
#include <bsoncxx/builder/stream/document.hpp>
#include <bsoncxx/json.hpp>

#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>
#include <mongocxx/options/client.hpp>
#include <mongocxx/options/ssl.hpp>
#include <mongocxx/uri.hpp>

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
	if (engine.rootObjects().isEmpty()) return -1;

	mongocxx::options::ssl ssl_opts{};
	ssl_opts.pem_file("/etc/ssl/mongodb.pem");
	ssl_opts.allow_invalid_certificates(true);
	mongocxx::options::client client_opts{};
	client_opts.ssl_opts(ssl_opts);

	auto client =
	mongocxx::client{mongocxx::uri{"mongodb://admin:abc123@localhost:27017/"
					   "?authSource=admin&ssl=true"},
			 client_opts};
	mongocxx::instance inst{};

	bsoncxx::builder::stream::document document{};

	auto collection = client["testdb"]["testcollection"];
	//	document << "hello"
	//		 << "world";

	//	collection.insert_one(document.view());
	auto cursor = collection.find({});

	for (auto &&doc : cursor)
	{
		std::cout << bsoncxx::to_json(doc) << std::endl;
	}

	return app.exec();
}
