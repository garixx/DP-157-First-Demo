CREATE DATABASE GameStore
GO

USE GameStore
GO

CREATE TABLE Games
(
	[GameID] INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(500) NOT NULL,
	[Description] NVARCHAR(1000) NOT NULL,
	[Category] NVARCHAR(100) NOT NULL,
	[Price] DECIMAL(16, 2) NOT NULL
);
GO

INSERT INTO Games(Name, Description, Category, Price) 
VALUES 
	('SimCity', N'Градостроительный симулятор снова с вами! Создайте город своей мечты', N'Симулятор', 1499.00),
	('TITANFALL', N'Эта игра перенесет вас во вселенную, где малое противопоставляется большому, природа – индустрии, а человек – машине', N'Шутер', 2299.00),
	('Battlefield 4', N'Battlefield 4 – это определяющий для жанра, полный экшена боевик, известный своей разрушаемостью, равных которой нет', N'Шутер', 899.40),
	('The Sims 4', N'В реальности каждому человеку дано прожить лишь одну жизнь. Но с помощью The Sims 4 это ограничение можно снять! 
		Вам решать — где, как и с кем жить, чем заниматься, чем украшать и обустраивать свой дом', N'Симулятор', 15.00),
	('Dark Souls 2', N'Продолжение знаменитого ролевого экшена вновь заставит игроков пройти через сложнейшие испытания. Dark Souls II предложит 
		нового героя, новую историю и новый мир. Лишь одно неизменно – выжить в мрачной вселенной Dark Souls очень непросто.', 'RPG', 949.00),
	('The Elder Scrolls V: Skyrim', N'После убийства короля Скайрима империя оказалась на грани катастрофы. Вокруг претендентов на престол сплотились новые союзы, 
		и разгорелся конфликт. К тому же, как предсказывали древние свитки, в мир вернулись жестокие и беспощадные драконы. Теперь будущее Скайрима и всей 
		империи зависит от драконорожденного — человека, в жилах которого течет кровь легендарных существ.', 'RPG', 1399.00),
	('FIFA 14', N'Достоверный, красивый, эмоциональный футбол! Проверенный временем геймплей FIFA стал ещё лучше благодаря инновациям, поощряющим творческую игру в
		 центре поля и позволяющим задавать её темп.', 'Симулятор', 699.00),
	('Need for Speed Rivals', N'Забудьте про стандартные режимы игры. Сотрите грань между одиночным и многопользовательским режимом в постоянном соперничестве 
		между гонщиками и полицией. Свободно войдите в мир, в котором ваши друзья уже участвуют в гонках и погонях. ', N'Симулятор', 15.00),
	('Crysis 3', N'Действие игры разворачивается в 2047 году, а вам предстоит выступить в роли Пророка.', 'Шутер', 1299.00),
	('Dead Space 3', N'В Dead Space 3 Айзек Кларк и суровый солдат Джон Карвер отправляются в космическое путешествие, чтобы узнать о происхождении некроморфов.', 'Шутер', 499.00);
GO	