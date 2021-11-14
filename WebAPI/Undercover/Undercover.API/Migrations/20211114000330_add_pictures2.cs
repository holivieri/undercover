using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Undercover.API.Migrations
{
    public partial class add_pictures2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ArtistPicture_Artists_ArtistId",
                table: "ArtistPicture");

            migrationBuilder.DropForeignKey(
                name: "FK_PlacePicture_Places_PlaceId",
                table: "PlacePicture");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PlacePicture",
                table: "PlacePicture");

            migrationBuilder.DropPrimaryKey(
                name: "PK_ArtistPicture",
                table: "ArtistPicture");

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

            migrationBuilder.RenameTable(
                name: "PlacePicture",
                newName: "PlacePictures");

            migrationBuilder.RenameTable(
                name: "ArtistPicture",
                newName: "ArtistPictures");

            migrationBuilder.RenameIndex(
                name: "IX_PlacePicture_PlaceId",
                table: "PlacePictures",
                newName: "IX_PlacePictures_PlaceId");

            migrationBuilder.RenameIndex(
                name: "IX_ArtistPicture_ArtistId",
                table: "ArtistPictures",
                newName: "IX_ArtistPictures_ArtistId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PlacePictures",
                table: "PlacePictures",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_ArtistPictures",
                table: "ArtistPictures",
                column: "Id");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "514ab5c9-99f6-4775-807a-17457c68d3d1", "51b8bf2c-1dd3-4d66-a272-c4185a6abfb2", "admin", "admin" },
                    { "14c0e088-1c88-40ab-bb96-886ab3fe4bf1", "c360dc54-f2a6-45a4-a1fa-552bdbda0c05", "artist", "artist" },
                    { "79a61732-4e4f-41f1-ba26-aa56463b581d", "b2b4bebf-892f-4cf3-a106-8d255dd4bfb4", "user", "user" },
                    { "3f17eea7-1261-4ef8-b660-43af23db90db", "3dfef266-73b2-4cdc-a32b-b25562293a13", "placeOwner", "placeOwner" }
                });

            migrationBuilder.InsertData(
                table: "Countries",
                columns: new[] { "Id", "Name" },
                values: new object[] { new Guid("0540d814-0335-4471-9228-022008407a95"), "Argentina" });

            migrationBuilder.InsertData(
                table: "Genres",
                columns: new[] { "Id", "CoverPicture", "Name" },
                values: new object[,]
                {
                    { new Guid("02260fd4-eaf2-41dd-b117-e9f00029f425"), null, "Rock" },
                    { new Guid("187d4ddf-35f6-491f-b7a1-2cc68c700b1c"), null, "Blues" },
                    { new Guid("6d7a840a-7346-40a5-b789-b375f2e3c987"), null, "Jazz" },
                    { new Guid("3381d3bc-a27d-4d47-bb27-73fab460ea4d"), null, "Hip Hop" },
                    { new Guid("8eae36e3-590b-44af-97c7-8d41166343da"), null, "Pop" },
                    { new Guid("a102fe9c-09f8-4ae0-9e7e-2ca782a310c5"), null, "Punk" },
                    { new Guid("3506e841-1439-407e-a8d3-34a3250ea6ee"), null, "Metal" }
                });

            migrationBuilder.AddForeignKey(
                name: "FK_ArtistPictures_Artists_ArtistId",
                table: "ArtistPictures",
                column: "ArtistId",
                principalTable: "Artists",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PlacePictures_Places_PlaceId",
                table: "PlacePictures",
                column: "PlaceId",
                principalTable: "Places",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ArtistPictures_Artists_ArtistId",
                table: "ArtistPictures");

            migrationBuilder.DropForeignKey(
                name: "FK_PlacePictures_Places_PlaceId",
                table: "PlacePictures");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PlacePictures",
                table: "PlacePictures");

            migrationBuilder.DropPrimaryKey(
                name: "PK_ArtistPictures",
                table: "ArtistPictures");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "14c0e088-1c88-40ab-bb96-886ab3fe4bf1");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "3f17eea7-1261-4ef8-b660-43af23db90db");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "514ab5c9-99f6-4775-807a-17457c68d3d1");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "79a61732-4e4f-41f1-ba26-aa56463b581d");

            migrationBuilder.DeleteData(
                table: "Countries",
                keyColumn: "Id",
                keyValue: new Guid("0540d814-0335-4471-9228-022008407a95"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("02260fd4-eaf2-41dd-b117-e9f00029f425"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("187d4ddf-35f6-491f-b7a1-2cc68c700b1c"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("3381d3bc-a27d-4d47-bb27-73fab460ea4d"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("3506e841-1439-407e-a8d3-34a3250ea6ee"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("6d7a840a-7346-40a5-b789-b375f2e3c987"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("8eae36e3-590b-44af-97c7-8d41166343da"));

            migrationBuilder.DeleteData(
                table: "Genres",
                keyColumn: "Id",
                keyValue: new Guid("a102fe9c-09f8-4ae0-9e7e-2ca782a310c5"));

            migrationBuilder.RenameTable(
                name: "PlacePictures",
                newName: "PlacePicture");

            migrationBuilder.RenameTable(
                name: "ArtistPictures",
                newName: "ArtistPicture");

            migrationBuilder.RenameIndex(
                name: "IX_PlacePictures_PlaceId",
                table: "PlacePicture",
                newName: "IX_PlacePicture_PlaceId");

            migrationBuilder.RenameIndex(
                name: "IX_ArtistPictures_ArtistId",
                table: "ArtistPicture",
                newName: "IX_ArtistPicture_ArtistId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PlacePicture",
                table: "PlacePicture",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_ArtistPicture",
                table: "ArtistPicture",
                column: "Id");

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

            migrationBuilder.AddForeignKey(
                name: "FK_ArtistPicture_Artists_ArtistId",
                table: "ArtistPicture",
                column: "ArtistId",
                principalTable: "Artists",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PlacePicture_Places_PlaceId",
                table: "PlacePicture",
                column: "PlaceId",
                principalTable: "Places",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
