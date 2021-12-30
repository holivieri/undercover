using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Undercover.API.Migrations
{
    public partial class notifications : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DeleteData(
            //    table: "AspNetRoles",
            //    keyColumn: "Id",
            //    keyValue: "0533b194-daf2-40f0-bbca-981c48229e55");

            //migrationBuilder.DeleteData(
            //    table: "AspNetRoles",
            //    keyColumn: "Id",
            //    keyValue: "0bd72234-b6f3-48f6-aea0-cc6e8dec0fb1");

            //migrationBuilder.DeleteData(
            //    table: "AspNetRoles",
            //    keyColumn: "Id",
            //    keyValue: "5c98c352-4aeb-474a-90fb-8f08fae0096b");

            //migrationBuilder.DeleteData(
            //    table: "AspNetRoles",
            //    keyColumn: "Id",
            //    keyValue: "9e22de93-4d37-4403-91a2-4daa194e73fa");

            //migrationBuilder.DeleteData(
            //    table: "Countries",
            //    keyColumn: "Id",
            //    keyValue: new Guid("1267bacd-a997-44df-9a25-2e405b0ea0d5"));

            //migrationBuilder.DeleteData(
            //    table: "Genres",
            //    keyColumn: "Id",
            //    keyValue: new Guid("2d787fa8-21b8-4a71-a8c2-cf0cca7bdd1a"));

            //migrationBuilder.DeleteData(
            //    table: "Genres",
            //    keyColumn: "Id",
            //    keyValue: new Guid("64e74203-3dea-41e5-9275-7d4e00801872"));

            //migrationBuilder.DeleteData(
            //    table: "Genres",
            //    keyColumn: "Id",
            //    keyValue: new Guid("801f7413-182a-4c42-bea9-3909e390fd36"));

            //migrationBuilder.DeleteData(
            //    table: "Genres",
            //    keyColumn: "Id",
            //    keyValue: new Guid("8a963800-2bca-46a9-9068-e51bfb479051"));

            //migrationBuilder.DeleteData(
            //    table: "Genres",
            //    keyColumn: "Id",
            //    keyValue: new Guid("99c29565-11b5-4ca9-8969-e3af9c4ffd8a"));

            //migrationBuilder.DeleteData(
            //    table: "Genres",
            //    keyColumn: "Id",
            //    keyValue: new Guid("aa96a0e4-c523-47d1-abb7-d6592a9ecad0"));

            //migrationBuilder.DeleteData(
            //    table: "Genres",
            //    keyColumn: "Id",
            //    keyValue: new Guid("b9ae2573-0167-4a01-a615-da46262150e4"));

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

            migrationBuilder.CreateTable(
                name: "Notifications",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Category = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Message = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: false),
                    Deleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Notifications", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Notifications_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.InsertData(
                table: "Artists",
                columns: new[] { "Id", "Bio", "CreatedDate", "FacebookAccount", "Followers", "ManagerContact", "ManagerName", "Name", "PictureUrl", "SoundCloudAccount", "SpotifyAccount", "TwitterAccount", "YouTubeAccount" },
                values: new object[,]
                {
                    { new Guid("8e6e5c68-c6e6-4803-a993-e7d2f978d545"), "Luego de una noche de sexo y alcohol los muchachos se pusieron a cantar la marcha peronista y descubrieron que tenian futuro en la música", new DateTime(2021, 12, 29, 7, 38, 29, 935, DateTimeKind.Utc).AddTicks(1495), "A_tu_Vieja", 150L, "15-4444-5555", "Ariel Sanchez", "A tu vieja le va a gustar", "https://lastfm.freetls.fastly.net/i/u/ar0/76b85924715ef309bab8885621a65a66.jpg", null, null, "@ATVLVAG", "tu_vieja" },
                    { new Guid("b5834850-90a3-435e-a25e-70e79a6131bb"), "Banda que surge en los sotanos del bajo Flores, cuando un grupo de amigos se junta a celebrar la prision domiciliaria de un entrañable del rock barrial.", new DateTime(2021, 12, 29, 7, 38, 29, 935, DateTimeKind.Utc).AddTicks(1462), "cadenaperpetua", 121L, "15-4444-5555", "Ariel Sanchez", "Cadena Perpetua", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOWx6qhLanoAcmkfVaSS2aGF1AHPhadAWp_iBX84YTTlPG0e2DreIcykftE_5rWCfwAN4&usqp=CAU", null, null, "@cadenaperpetua", "CadenaPerpetua" }
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "1f0c4b6a-52aa-479b-b5ba-c804b7ceff60", "96db1ed0-87cf-442b-8b2d-2923abf1c742", "user", "user" },
                    { "cc63af23-4f7c-4a8f-aa03-3482f79d7972", "4c8b3165-c5ba-4089-b58f-2b042815ecd9", "artist", "artist" },
                    { "d740b158-0819-40c0-a7bb-a38d2530446f", "3c9a8144-4819-46eb-8dd0-0acf724935b5", "placeOwner", "placeOwner" },
                    { "e1d691b1-1c3f-4285-b649-33fd9e338a6e", "741a8865-ac8c-4099-92d8-de725b6780ec", "admin", "admin" }
                });

            migrationBuilder.InsertData(
                table: "Countries",
                columns: new[] { "Id", "Name" },
                values: new object[] { new Guid("20862408-5d2d-419e-bb09-52c051de1d30"), "Argentina" });

            migrationBuilder.InsertData(
                table: "Genres",
                columns: new[] { "Id", "CoverPicture", "Name" },
                values: new object[,]
                {
                    { new Guid("011e4a8b-0df4-48c1-b236-c6112b8402a9"), null, "Jazz" },
                    { new Guid("0a79245c-6cc0-4382-b4b8-cb7e4ef8a617"), null, "Hip Hop" },
                    { new Guid("196dc992-5786-4f97-924c-c027eae85166"), null, "Punk" },
                    { new Guid("2139aea9-f474-4433-b3d9-4dc2d83baf54"), null, "Blues" },
                    { new Guid("2c5eb853-b088-446e-a2f8-dcdb20f5aae0"), null, "Metal" },
                    { new Guid("43d4763a-4dd8-4da6-ab7d-9a3b3c3e5999"), null, "Pop" },
                    { new Guid("9c6c8c3f-15f5-496e-bc24-4472d4c20f5f"), null, "Rock" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Notifications_UserId",
                table: "Notifications",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Notifications");

            migrationBuilder.DeleteData(
                table: "Artists",
                keyColumn: "Id",
                keyValue: new Guid("8e6e5c68-c6e6-4803-a993-e7d2f978d545"));

            migrationBuilder.DeleteData(
                table: "Artists",
                keyColumn: "Id",
                keyValue: new Guid("b5834850-90a3-435e-a25e-70e79a6131bb"));

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "1f0c4b6a-52aa-479b-b5ba-c804b7ceff60");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "cc63af23-4f7c-4a8f-aa03-3482f79d7972");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "d740b158-0819-40c0-a7bb-a38d2530446f");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "e1d691b1-1c3f-4285-b649-33fd9e338a6e");

            migrationBuilder.DeleteData(
                table: "Countries",
                keyColumn: "Id",
                keyValue: new Guid("20862408-5d2d-419e-bb09-52c051de1d30"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("011e4a8b-0df4-48c1-b236-c6112b8402a9"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("0a79245c-6cc0-4382-b4b8-cb7e4ef8a617"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("196dc992-5786-4f97-924c-c027eae85166"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("2139aea9-f474-4433-b3d9-4dc2d83baf54"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("2c5eb853-b088-446e-a2f8-dcdb20f5aae0"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("43d4763a-4dd8-4da6-ab7d-9a3b3c3e5999"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("9c6c8c3f-15f5-496e-bc24-4472d4c20f5f"));

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
