using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Undercover.API.Migrations
{
    public partial class phonenumber : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ArtistGenre_Artists_ArtistId",
                table: "ArtistGenre");

            migrationBuilder.DropForeignKey(
                name: "FK_ArtistGenre_Genres_GenreId",
                table: "ArtistGenre");

            migrationBuilder.DropForeignKey(
                name: "FK_Concerts_Artists_ArtistId",
                table: "Concerts");

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

            migrationBuilder.RenameColumn(
                name: "GenreId",
                table: "ArtistGenre",
                newName: "GenresId");

            migrationBuilder.RenameColumn(
                name: "ArtistId",
                table: "ArtistGenre",
                newName: "ArtistsId");

            migrationBuilder.RenameIndex(
                name: "IX_ArtistGenre_GenreId",
                table: "ArtistGenre",
                newName: "IX_ArtistGenre_GenresId");

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "Places",
                type: "nvarchar(500)",
                maxLength: 500,
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "Dislikes",
                table: "Places",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);

            migrationBuilder.AddColumn<long>(
                name: "Likes",
                table: "Places",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);

            migrationBuilder.AddColumn<string>(
                name: "PhoneNumber",
                table: "Places",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AlterColumn<Guid>(
                name: "ArtistId",
                table: "Concerts",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
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

            migrationBuilder.AddForeignKey(
                name: "FK_ArtistGenre_Artists_ArtistsId",
                table: "ArtistGenre",
                column: "ArtistsId",
                principalTable: "Artists",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ArtistGenre_Genres_GenresId",
                table: "ArtistGenre",
                column: "GenresId",
                principalTable: "Genres",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Concerts_Artists_ArtistId",
                table: "Concerts",
                column: "ArtistId",
                principalTable: "Artists",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ArtistGenre_Artists_ArtistsId",
                table: "ArtistGenre");

            migrationBuilder.DropForeignKey(
                name: "FK_ArtistGenre_Genres_GenresId",
                table: "ArtistGenre");

            migrationBuilder.DropForeignKey(
                name: "FK_Concerts_Artists_ArtistId",
                table: "Concerts");

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
                name: "Description",
                table: "Places");

            migrationBuilder.DropColumn(
                name: "Dislikes",
                table: "Places");

            migrationBuilder.DropColumn(
                name: "Likes",
                table: "Places");

            migrationBuilder.DropColumn(
                name: "PhoneNumber",
                table: "Places");

            migrationBuilder.RenameColumn(
                name: "GenresId",
                table: "ArtistGenre",
                newName: "GenreId");

            migrationBuilder.RenameColumn(
                name: "ArtistsId",
                table: "ArtistGenre",
                newName: "ArtistId");

            migrationBuilder.RenameIndex(
                name: "IX_ArtistGenre_GenresId",
                table: "ArtistGenre",
                newName: "IX_ArtistGenre_GenreId");

            migrationBuilder.AlterColumn<Guid>(
                name: "ArtistId",
                table: "Concerts",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "14c0e088-1c88-40ab-bb96-886ab3fe4bf1", "c360dc54-f2a6-45a4-a1fa-552bdbda0c05", "artist", "artist" },
                    { "3f17eea7-1261-4ef8-b660-43af23db90db", "3dfef266-73b2-4cdc-a32b-b25562293a13", "placeOwner", "placeOwner" },
                    { "514ab5c9-99f6-4775-807a-17457c68d3d1", "51b8bf2c-1dd3-4d66-a272-c4185a6abfb2", "admin", "admin" },
                    { "79a61732-4e4f-41f1-ba26-aa56463b581d", "b2b4bebf-892f-4cf3-a106-8d255dd4bfb4", "user", "user" }
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
                    { new Guid("3381d3bc-a27d-4d47-bb27-73fab460ea4d"), null, "Hip Hop" },
                    { new Guid("3506e841-1439-407e-a8d3-34a3250ea6ee"), null, "Metal" },
                    { new Guid("6d7a840a-7346-40a5-b789-b375f2e3c987"), null, "Jazz" },
                    { new Guid("8eae36e3-590b-44af-97c7-8d41166343da"), null, "Pop" },
                    { new Guid("a102fe9c-09f8-4ae0-9e7e-2ca782a310c5"), null, "Punk" }
                });

            migrationBuilder.AddForeignKey(
                name: "FK_ArtistGenre_Artists_ArtistId",
                table: "ArtistGenre",
                column: "ArtistId",
                principalTable: "Artists",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ArtistGenre_Genres_GenreId",
                table: "ArtistGenre",
                column: "GenreId",
                principalTable: "Genres",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Concerts_Artists_ArtistId",
                table: "Concerts",
                column: "ArtistId",
                principalTable: "Artists",
                principalColumn: "Id");
        }
    }
}
