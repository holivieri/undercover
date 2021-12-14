using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Undercover.API.Migrations
{
    public partial class users2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Artists_AspNetUsers_UserId",
                table: "Artists");

            migrationBuilder.DropForeignKey(
                name: "FK_Concerts_AspNetUsers_UserId",
                table: "Concerts");

            migrationBuilder.DropForeignKey(
                name: "FK_Genres_AspNetUsers_UserId",
                table: "Genres");

            migrationBuilder.DropForeignKey(
                name: "FK_Places_AspNetUsers_UserId",
                table: "Places");

            migrationBuilder.DropIndex(
                name: "IX_Places_UserId",
                table: "Places");

            migrationBuilder.DropIndex(
                name: "IX_Genres_UserId",
                table: "Genres");

            migrationBuilder.DropIndex(
                name: "IX_Concerts_UserId",
                table: "Concerts");

            migrationBuilder.DropIndex(
                name: "IX_Artists_UserId",
                table: "Artists");

            migrationBuilder.DeleteData(
                table: "Artists",
                keyColumn: "Id",
                keyValue: new Guid("0f911145-7b2b-4cea-8dc1-acde7843dff2"));

            migrationBuilder.DeleteData(
                table: "Artists",
                keyColumn: "Id",
                keyValue: new Guid("31005ac7-ec90-4a5b-bba0-0bb3d1621b15"));

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "0da6e4bf-8f95-46b8-83c3-adcab2bc0662");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "127745c4-415f-41ec-8f38-bd9e01e0a2ce");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "6bea85d0-7449-449c-890d-50bdcb268fb4");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "80efdd00-d13b-4323-b8c6-d714669742d3");

            migrationBuilder.DeleteData(
                table: "Countries",
                keyColumn: "Id",
                keyValue: new Guid("c4f4fc39-ff2c-476b-b7d5-dd752f08a437"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("4ace03b5-104d-4bfd-9388-db4805288c83"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("4ece17a5-c394-41cb-b922-339bd65dbcb1"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("69995c6a-513f-4352-8340-9da5005ef316"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("72162ed7-329b-4824-b5d4-6e9cc87c50bd"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("9f5c233e-54dd-4ccd-a160-29ad01fb6118"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("cc3d0d7c-d3e5-4eb3-97d9-7a41c98aed3b"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("d912dc79-d47e-4642-af61-8e72d935192d"));

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Places");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Genres");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Concerts");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Artists");

            migrationBuilder.CreateTable(
                name: "ArtistUser",
                columns: table => new
                {
                    MyArtistsId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UsersId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ArtistUser", x => new { x.MyArtistsId, x.UsersId });
                    table.ForeignKey(
                        name: "FK_ArtistUser_Artists_MyArtistsId",
                        column: x => x.MyArtistsId,
                        principalTable: "Artists",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ArtistUser_AspNetUsers_UsersId",
                        column: x => x.UsersId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ConcertUser",
                columns: table => new
                {
                    MyConcertsId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UsersId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ConcertUser", x => new { x.MyConcertsId, x.UsersId });
                    table.ForeignKey(
                        name: "FK_ConcertUser_AspNetUsers_UsersId",
                        column: x => x.UsersId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ConcertUser_Concerts_MyConcertsId",
                        column: x => x.MyConcertsId,
                        principalTable: "Concerts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "GenreUser",
                columns: table => new
                {
                    MyGenresId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UsersId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GenreUser", x => new { x.MyGenresId, x.UsersId });
                    table.ForeignKey(
                        name: "FK_GenreUser_AspNetUsers_UsersId",
                        column: x => x.UsersId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_GenreUser_Genres_MyGenresId",
                        column: x => x.MyGenresId,
                        principalTable: "Genres",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PlaceUser",
                columns: table => new
                {
                    MyPlacesId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UsersId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PlaceUser", x => new { x.MyPlacesId, x.UsersId });
                    table.ForeignKey(
                        name: "FK_PlaceUser_AspNetUsers_UsersId",
                        column: x => x.UsersId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PlaceUser_Places_MyPlacesId",
                        column: x => x.MyPlacesId,
                        principalTable: "Places",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Artists",
                columns: new[] { "Id", "Bio", "CreatedDate", "FacebookAccount", "Followers", "ManagerContact", "ManagerName", "Name", "PictureUrl", "SoundCloudAccount", "SpotifyAccount", "TwitterAccount", "YouTubeAccount" },
                values: new object[,]
                {
                    { new Guid("3cc05136-142e-4d08-982f-46a2c28d182e"), "Luego de una noche de sexo y alcohol los muchachos se pusieron a cantar la marcha peronista y descubrieron que tenian futuro en la música", new DateTime(2021, 12, 14, 6, 48, 49, 181, DateTimeKind.Utc).AddTicks(2760), "A_tu_Vieja", 150L, "15-4444-5555", "Ariel Sanchez", "A tu vieja le va a gustar", "https://lastfm.freetls.fastly.net/i/u/ar0/76b85924715ef309bab8885621a65a66.jpg", null, null, "@ATVLVAG", "tu_vieja" },
                    { new Guid("74668b76-c118-4205-b6c4-6b4f4adc1151"), "Banda que surge en los sotanos del bajo Flores, cuando un grupo de amigos se junta a celebrar la prision domiciliaria de un entrañable del rock barrial.", new DateTime(2021, 12, 14, 6, 48, 49, 181, DateTimeKind.Utc).AddTicks(2724), "cadenaperpetua", 121L, "15-4444-5555", "Ariel Sanchez", "Cadena Perpetua", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOWx6qhLanoAcmkfVaSS2aGF1AHPhadAWp_iBX84YTTlPG0e2DreIcykftE_5rWCfwAN4&usqp=CAU", null, null, "@cadenaperpetua", "CadenaPerpetua" }
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "142f05a8-5691-401b-9d89-f6d672190c55", "c6b1b9c8-035a-4748-97ad-39deb1e04cd7", "placeOwner", "placeOwner" },
                    { "1e6a28f2-eabe-4160-b639-040bed16298a", "9c11fc5c-a974-4d8d-a15d-cf390048a508", "user", "user" },
                    { "5cd73a48-af41-4725-a755-571aecba8756", "e6828a1c-86c0-4355-8ca8-5fb57f51c0c1", "admin", "admin" },
                    { "76fd1e27-a710-464e-9d6d-c4d0967a332c", "db3da450-29eb-49e8-a28e-fa1e901fbc7c", "artist", "artist" }
                });

            migrationBuilder.InsertData(
                table: "Countries",
                columns: new[] { "Id", "Name" },
                values: new object[] { new Guid("0e0d7e2e-6624-4315-89b0-cedf9ae190b3"), "Argentina" });

            migrationBuilder.InsertData(
                table: "Genres",
                columns: new[] { "Id", "CoverPicture", "Name" },
                values: new object[,]
                {
                    { new Guid("16c12875-d18e-4fa2-a772-ce0e69cd5ccc"), null, "Rock" },
                    { new Guid("235857f9-4f2c-4214-a10d-a6a47f7efec9"), null, "Jazz" },
                    { new Guid("2cd04ce9-965a-48d2-a0b3-0da4408bce9a"), null, "Metal" },
                    { new Guid("48ba8f78-48d7-4c32-b22c-b73ecfd2e132"), null, "Punk" },
                    { new Guid("6e2dc6a2-b5d3-49d1-a6c3-d6852159f40b"), null, "Blues" },
                    { new Guid("75505d0b-bade-44f3-9423-4147948bf464"), null, "Hip Hop" },
                    { new Guid("b16c3fce-449a-4652-8a14-fd1aaccbadbf"), null, "Pop" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_ArtistUser_UsersId",
                table: "ArtistUser",
                column: "UsersId");

            migrationBuilder.CreateIndex(
                name: "IX_ConcertUser_UsersId",
                table: "ConcertUser",
                column: "UsersId");

            migrationBuilder.CreateIndex(
                name: "IX_GenreUser_UsersId",
                table: "GenreUser",
                column: "UsersId");

            migrationBuilder.CreateIndex(
                name: "IX_PlaceUser_UsersId",
                table: "PlaceUser",
                column: "UsersId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ArtistUser");

            migrationBuilder.DropTable(
                name: "ConcertUser");

            migrationBuilder.DropTable(
                name: "GenreUser");

            migrationBuilder.DropTable(
                name: "PlaceUser");

            migrationBuilder.DeleteData(
                table: "Artists",
                keyColumn: "Id",
                keyValue: new Guid("3cc05136-142e-4d08-982f-46a2c28d182e"));

            migrationBuilder.DeleteData(
                table: "Artists",
                keyColumn: "Id",
                keyValue: new Guid("74668b76-c118-4205-b6c4-6b4f4adc1151"));

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "142f05a8-5691-401b-9d89-f6d672190c55");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "1e6a28f2-eabe-4160-b639-040bed16298a");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5cd73a48-af41-4725-a755-571aecba8756");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "76fd1e27-a710-464e-9d6d-c4d0967a332c");

            migrationBuilder.DeleteData(
                table: "Countries",
                keyColumn: "Id",
                keyValue: new Guid("0e0d7e2e-6624-4315-89b0-cedf9ae190b3"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("16c12875-d18e-4fa2-a772-ce0e69cd5ccc"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("235857f9-4f2c-4214-a10d-a6a47f7efec9"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("2cd04ce9-965a-48d2-a0b3-0da4408bce9a"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("48ba8f78-48d7-4c32-b22c-b73ecfd2e132"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("6e2dc6a2-b5d3-49d1-a6c3-d6852159f40b"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("75505d0b-bade-44f3-9423-4147948bf464"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("b16c3fce-449a-4652-8a14-fd1aaccbadbf"));

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Places",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Genres",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Concerts",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Artists",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.InsertData(
                table: "Artists",
                columns: new[] { "Id", "Bio", "CreatedDate", "FacebookAccount", "Followers", "ManagerContact", "ManagerName", "Name", "PictureUrl", "SoundCloudAccount", "SpotifyAccount", "TwitterAccount", "UserId", "YouTubeAccount" },
                values: new object[,]
                {
                    { new Guid("0f911145-7b2b-4cea-8dc1-acde7843dff2"), "Luego de una noche de sexo y alcohol los muchachos se pusieron a cantar la marcha peronista y descubrieron que tenian futuro en la música", new DateTime(2021, 12, 14, 6, 42, 44, 14, DateTimeKind.Utc).AddTicks(9280), "A_tu_Vieja", 150L, "15-4444-5555", "Ariel Sanchez", "A tu vieja le va a gustar", "https://lastfm.freetls.fastly.net/i/u/ar0/76b85924715ef309bab8885621a65a66.jpg", null, null, "@ATVLVAG", null, "tu_vieja" },
                    { new Guid("31005ac7-ec90-4a5b-bba0-0bb3d1621b15"), "Banda que surge en los sotanos del bajo Flores, cuando un grupo de amigos se junta a celebrar la prision domiciliaria de un entrañable del rock barrial.", new DateTime(2021, 12, 14, 6, 42, 44, 14, DateTimeKind.Utc).AddTicks(9239), "cadenaperpetua", 121L, "15-4444-5555", "Ariel Sanchez", "Cadena Perpetua", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOWx6qhLanoAcmkfVaSS2aGF1AHPhadAWp_iBX84YTTlPG0e2DreIcykftE_5rWCfwAN4&usqp=CAU", null, null, "@cadenaperpetua", null, "CadenaPerpetua" }
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "0da6e4bf-8f95-46b8-83c3-adcab2bc0662", "d82dfb63-c629-4da4-a9e6-969dfeda52df", "user", "user" },
                    { "127745c4-415f-41ec-8f38-bd9e01e0a2ce", "96f8c4a2-b2f0-4367-9bc6-7d9b043f92cc", "artist", "artist" },
                    { "6bea85d0-7449-449c-890d-50bdcb268fb4", "17b1527c-978c-4a7a-a321-7469d09b19e5", "placeOwner", "placeOwner" },
                    { "80efdd00-d13b-4323-b8c6-d714669742d3", "950fe483-2079-4705-859c-99c5887635d2", "admin", "admin" }
                });

            migrationBuilder.InsertData(
                table: "Countries",
                columns: new[] { "Id", "Name" },
                values: new object[] { new Guid("c4f4fc39-ff2c-476b-b7d5-dd752f08a437"), "Argentina" });

            migrationBuilder.InsertData(
                table: "Genres",
                columns: new[] { "Id", "CoverPicture", "Name", "UserId" },
                values: new object[,]
                {
                    { new Guid("4ace03b5-104d-4bfd-9388-db4805288c83"), null, "Punk", null },
                    { new Guid("4ece17a5-c394-41cb-b922-339bd65dbcb1"), null, "Hip Hop", null },
                    { new Guid("69995c6a-513f-4352-8340-9da5005ef316"), null, "Blues", null },
                    { new Guid("72162ed7-329b-4824-b5d4-6e9cc87c50bd"), null, "Metal", null },
                    { new Guid("9f5c233e-54dd-4ccd-a160-29ad01fb6118"), null, "Jazz", null },
                    { new Guid("cc3d0d7c-d3e5-4eb3-97d9-7a41c98aed3b"), null, "Rock", null },
                    { new Guid("d912dc79-d47e-4642-af61-8e72d935192d"), null, "Pop", null }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Places_UserId",
                table: "Places",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Genres_UserId",
                table: "Genres",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Concerts_UserId",
                table: "Concerts",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Artists_UserId",
                table: "Artists",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Artists_AspNetUsers_UserId",
                table: "Artists",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Concerts_AspNetUsers_UserId",
                table: "Concerts",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Genres_AspNetUsers_UserId",
                table: "Genres",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Places_AspNetUsers_UserId",
                table: "Places",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }
    }
}
