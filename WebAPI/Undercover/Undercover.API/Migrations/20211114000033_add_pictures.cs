using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Undercover.API.Migrations
{
    public partial class add_pictures : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "c656d525-88b9-424e-9188-810cfcea62d1");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "cf6e47c5-3c6a-41ef-b932-5a3eb9aab893");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "d4800eb4-fdb3-45f5-b446-a8e24b4ded17");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "f7488814-644d-4b10-81e5-0c9a8c490daa");

            migrationBuilder.DeleteData(
                table: "Countries",
                keyColumn: "Id",
                keyValue: new Guid("217c8a7e-ac0a-4ffa-b50d-9efecec87cfa"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("2a6524df-0ff9-4653-88e3-5e6a3ee81655"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("3dbc1e47-2a3d-499d-9f33-71f93076d67b"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("3ef2cf7b-f325-44b8-8aec-ffbfd64a07bf"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("539c697d-e747-4d4a-9f15-76cef6487355"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("74ec0464-4d9d-4541-a5c9-218158ab0736"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("bbf597d0-8df3-4698-b723-571754c1e698"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("be03ffac-e5d6-48ad-a924-b0f55851c4c4"));

            migrationBuilder.AddColumn<string>(
                name: "CoverPicture",
                table: "Places",
                maxLength: 300,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CoverPicture",
                table: "Genres",
                maxLength: 300,
                nullable: true);

            migrationBuilder.CreateTable(
                name: "ArtistPicture",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    PictureUrl = table.Column<string>(maxLength: 300, nullable: false),
                    Likes = table.Column<long>(nullable: false),
                    ArtistId = table.Column<Guid>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ArtistPicture", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ArtistPicture_Artists_ArtistId",
                        column: x => x.ArtistId,
                        principalTable: "Artists",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PlacePicture",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    PictureUrl = table.Column<string>(maxLength: 300, nullable: false),
                    Likes = table.Column<long>(nullable: false),
                    PlaceId = table.Column<Guid>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PlacePicture", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PlacePicture_Places_PlaceId",
                        column: x => x.PlaceId,
                        principalTable: "Places",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "d221b4c8-6352-48fe-834b-46276d5c996b", "bc11d170-bab3-4ce8-bd9c-f84a56292860", "admin", "admin" },
                    { "cc6d6f67-13cb-4b2c-a8f1-ffe1a9c1107a", "32e784d7-72e5-4bf5-8ef1-1c3434217ce7", "artist", "artist" },
                    { "555494eb-97da-492b-a371-7be3c27c9f6b", "e1bf35d7-adc4-4d49-accd-aa6d2e83cb76", "user", "user" },
                    { "137dd9cb-861b-401c-9ae4-bf2fa511972b", "4fd1bb35-b8f1-4730-8df8-580439809f05", "placeOwner", "placeOwner" }
                });

            migrationBuilder.InsertData(
                table: "Countries",
                columns: new[] { "Id", "Name" },
                values: new object[] { new Guid("7dddb130-dd1e-4dd8-9294-cd23d9402f51"), "Argentina" });

            migrationBuilder.InsertData(
                table: "Genres",
                columns: new[] { "Id", "CoverPicture", "Name" },
                values: new object[,]
                {
                    { new Guid("ad3d6882-8662-40be-8c52-d1cf6fd9a57e"), null, "Rock" },
                    { new Guid("67fdcd35-64ef-4478-9d85-030f5992fad0"), null, "Blues" },
                    { new Guid("7785d19a-6ba8-4717-a46e-61054065a597"), null, "Jazz" },
                    { new Guid("65d8ab52-a879-47ac-a2a9-647518822a18"), null, "Hip Hop" },
                    { new Guid("c549983f-fbea-485a-9ff7-d90d7b137308"), null, "Pop" },
                    { new Guid("7b9631a3-d0ba-4530-8122-e3ee088205d4"), null, "Punk" },
                    { new Guid("e1577957-e777-41fb-9af9-4a938129cbf1"), null, "Metal" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_ArtistPicture_ArtistId",
                table: "ArtistPicture",
                column: "ArtistId");

            migrationBuilder.CreateIndex(
                name: "IX_PlacePicture_PlaceId",
                table: "PlacePicture",
                column: "PlaceId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ArtistPicture");

            migrationBuilder.DropTable(
                name: "PlacePicture");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "137dd9cb-861b-401c-9ae4-bf2fa511972b");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "555494eb-97da-492b-a371-7be3c27c9f6b");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "cc6d6f67-13cb-4b2c-a8f1-ffe1a9c1107a");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "d221b4c8-6352-48fe-834b-46276d5c996b");

            migrationBuilder.DeleteData(
                table: "Countries",
                keyColumn: "Id",
                keyValue: new Guid("7dddb130-dd1e-4dd8-9294-cd23d9402f51"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("65d8ab52-a879-47ac-a2a9-647518822a18"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("67fdcd35-64ef-4478-9d85-030f5992fad0"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("7785d19a-6ba8-4717-a46e-61054065a597"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("7b9631a3-d0ba-4530-8122-e3ee088205d4"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("ad3d6882-8662-40be-8c52-d1cf6fd9a57e"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("c549983f-fbea-485a-9ff7-d90d7b137308"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("e1577957-e777-41fb-9af9-4a938129cbf1"));

            migrationBuilder.DropColumn(
                name: "CoverPicture",
                table: "Places");

            migrationBuilder.DropColumn(
                name: "CoverPicture",
                table: "Genres");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "d4800eb4-fdb3-45f5-b446-a8e24b4ded17", "5b11b2d5-902f-4abc-a3c1-ed2fb038fd20", "admin", "admin" },
                    { "cf6e47c5-3c6a-41ef-b932-5a3eb9aab893", "6504f2b7-f3eb-40cb-b750-05bd0f3c90b6", "artist", "artist" },
                    { "c656d525-88b9-424e-9188-810cfcea62d1", "58189032-0c59-455a-a926-ae1fc7eea0b7", "user", "user" },
                    { "f7488814-644d-4b10-81e5-0c9a8c490daa", "cc89eff9-f013-4717-a09c-6cfe9f3654a7", "placeOwner", "placeOwner" }
                });

            migrationBuilder.InsertData(
                table: "Countries",
                columns: new[] { "Id", "Name" },
                values: new object[] { new Guid("217c8a7e-ac0a-4ffa-b50d-9efecec87cfa"), "Argentina" });

            migrationBuilder.InsertData(
                table: "Genres",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { new Guid("2a6524df-0ff9-4653-88e3-5e6a3ee81655"), "Rock" },
                    { new Guid("be03ffac-e5d6-48ad-a924-b0f55851c4c4"), "Blues" },
                    { new Guid("bbf597d0-8df3-4698-b723-571754c1e698"), "Jazz" },
                    { new Guid("3dbc1e47-2a3d-499d-9f33-71f93076d67b"), "Hip Hop" },
                    { new Guid("539c697d-e747-4d4a-9f15-76cef6487355"), "Pop" },
                    { new Guid("3ef2cf7b-f325-44b8-8aec-ffbfd64a07bf"), "Punk" },
                    { new Guid("74ec0464-4d9d-4541-a5c9-218158ab0736"), "Metal" }
                });
        }
    }
}
