Subject: Re: [PATCH] arm-bsp/image_types_disk_img: do not force 'ext4' FS by default
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 16 Jul 2020 05:02:06 -0700
References: <20200716115329.19153-1-kamil.dziezyk@arm.com>
In-Reply-To: <20200716115329.19153-1-kamil.dziezyk@arm.com>
Message-ID: <5153.1594900926066387786@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 12:53 PM, Kamil Dziezyk wrote:

>
> In some cases user doesn't want to create any file system on a specific
> partition.
>=20
> Change-Id: I4596d97b95034952436cfd0a267a3f6ae4c0401d
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-bsp/classes/image_types_disk_img.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arm-bsp/classes/image_types_disk_img.bbclass
> b/meta-arm-bsp/classes/image_types_disk_img.bbclass
> index ea7ba86..78cc0d8 100644
> --- a/meta-arm-bsp/classes/image_types_disk_img.bbclass
> +++ b/meta-arm-bsp/classes/image_types_disk_img.bbclass
> @@ -51,7 +51,7 @@ disk_img_createpart() {
>      local imagefile=3D"$1"
>      local start=3D"$2"
>      local size=3D"$3"
> -    local fstype=3D"${4:-ext4}"
> +    local fstype=3D"${4:-}"
>      local content=3D"${5:-}"
>      local formatargs=3D""
>  
> --=20
> 2.17.1
>=20
>
