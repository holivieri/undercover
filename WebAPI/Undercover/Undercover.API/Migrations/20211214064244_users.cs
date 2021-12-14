using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Undercover.API.Migrations
{
    public partial class users : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "0533b194-daf2-40f0-bbca-981c48229e55");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "0bd72234-b6f3-48f6-aea0-cc6e8dec0fb1");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5c98c352-4aeb-474a-90fb-8f08fae0096b");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "9e22de93-4d37-4403-91a2-4daa194e73fa");

            migrationBuilder.DeleteData(
                table: "Countries",
                keyColumn: "Id",
                keyValue: new Guid("1267bacd-a997-44df-9a25-2e405b0ea0d5"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("2d787fa8-21b8-4a71-a8c2-cf0cca7bdd1a"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("64e74203-3dea-41e5-9275-7d4e00801872"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("801f7413-182a-4c42-bea9-3909e390fd36"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("8a963800-2bca-46a9-9068-e51bfb479051"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("99c29565-11b5-4ca9-8969-e3af9c4ffd8a"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("aa96a0e4-c523-47d1-abb7-d6592a9ecad0"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("b9ae2573-0167-4a01-a615-da46262150e4"));

            migrationBuilder.DropColumn(
                name: "UserEmail",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "UserPassword",
                table: "AspNetUsers");

            migrationBuilder.AlterColumn<string>(
                name: "Floor",
                table: "Places",
                type: "nvarchar(20)",
                maxLength: 20,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(10)",
                oldMaxLength: 10,
                oldNullable: true);

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

            migrationBuilder.AddColumn<Guid>(
                name: "MyCountryId",
                table: "AspNetUsers",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Artists",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "UserPicture",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    PictureUrl = table.Column<string>(type: "nvarchar(300)", maxLength: 300, nullable: false),
                    Likes = table.Column<long>(type: "bigint", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserPicture", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserPicture_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                });

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
                name: "IX_AspNetUsers_MyCountryId",
                table: "AspNetUsers",
                column: "MyCountryId");

            migrationBuilder.CreateIndex(
                name: "IX_Artists_UserId",
                table: "Artists",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPicture_UserId",
                table: "UserPicture",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Artists_AspNetUsers_UserId",
                table: "Artists",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Countries_MyCountryId",
                table: "AspNetUsers",
                column: "MyCountryId",
                principalTable: "Countries",
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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Artists_AspNetUsers_UserId",
                table: "Artists");

            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Countries_MyCountryId",
                table: "AspNetUsers");

            migrationBuilder.DropForeignKey(
                name: "FK_Concerts_AspNetUsers_UserId",
                table: "Concerts");

            migrationBuilder.DropForeignKey(
                name: "FK_Genres_AspNetUsers_UserId",
                table: "Genres");

            migrationBuilder.DropForeignKey(
                name: "FK_Places_AspNetUsers_UserId",
                table: "Places");

            migrationBuilder.DropTable(
                name: "UserPicture");

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
                name: "IX_AspNetUsers_MyCountryId",
                table: "AspNetUsers");

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
                name: "MyCountryId",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Artists");

            migrationBuilder.AlterColumn<string>(
                name: "Floor",
                table: "Places",
                type: "nvarchar(10)",
                maxLength: 10,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(20)",
                oldMaxLength: 20,
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UserEmail",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UserPassword",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "0533b194-daf2-40f0-bbca-981c48229e55", "d89e4dc9-1c27-4c67-8ca8-614c3f2b8160", "placeOwner", "placeOwner" },
                    { "0bd72234-b6f3-48f6-aea0-cc6e8dec0fb1", "ac4c288c-447c-4e22-8f7a-f903af3e2962", "artist", "artist" },
                    { "5c98c352-4aeb-474a-90fb-8f08fae0096b", "b507af8a-f95c-4260-af8f-2cbab0e4be15", "admin", "admin" },
                    { "9e22de93-4d37-4403-91a2-4daa194e73fa", "8601a94f-f896-41a6-8f67-5e84eff782c3", "user", "user" }
                });

            migrationBuilder.InsertData(
                table: "Countries",
                columns: new[] { "Id", "Name" },
                values: new object[] { new Guid("1267bacd-a997-44df-9a25-2e405b0ea0d5"), "Argentina" });

            migrationBuilder.InsertData(
                table: "Genres",
                columns: new[] { "Id", "CoverPicture", "Name" },
                values: new object[,]
                {
                    { new Guid("2d787fa8-21b8-4a71-a8c2-cf0cca7bdd1a"), null, "Rock" },
                    { new Guid("64e74203-3dea-41e5-9275-7d4e00801872"), null, "Jazz" },
                    { new Guid("801f7413-182a-4c42-bea9-3909e390fd36"), null, "Punk" },
                    { new Guid("8a963800-2bca-46a9-9068-e51bfb479051"), null, "Blues" },
                    { new Guid("99c29565-11b5-4ca9-8969-e3af9c4ffd8a"), null, "Hip Hop" },
                    { new Guid("aa96a0e4-c523-47d1-abb7-d6592a9ecad0"), null, "Pop" },
                    { new Guid("b9ae2573-0167-4a01-a615-da46262150e4"), null, "Metal" }
                });
        }
    }
}
