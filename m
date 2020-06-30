Subject: Re: [PATCH RESEND 1/2] arm: Introduce 4.19 Android Common Kernel
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 30 Jun 2020 01:13:25 -0700
References: <20200629154124.9825-1-teo.coupriediaz@arm.com>
In-Reply-To: <20200629154124.9825-1-teo.coupriediaz@arm.com>
Message-ID: <15141.1593504805509957329@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 04:41 PM, Teo Couprie Diaz wrote:

>
> This recipe targets machines based on arm64.
> Change-Id: I9f9556c3ce3636a31fb3a6faf38494335be6b997
> Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../linux/linux-arm64-ack_4.19.bb             | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.b=
b
>=20
> diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
> b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
> new file mode 100644
> index 0000000..99db960
> --- /dev/null
> +++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: Apache-2.0
> +#
> +# Copyright (c) 2020 Arm Limited
> +#
> +
> +
> +DESCRIPTION =3D "Linux Android Common Kernel"
> +SECTION =3D "kernel"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${S}/COPYING;md5=3Dbbea815ee2795b2f4230826=
c0c6b8814"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +COMPATIBLE_MACHINE ?=3D "invalid"
> +
> +ARCH =3D "arm64"
> +
> +SRC_URI =3D " \
> +  =20
> git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;branch=
=
=3Dandroid-4.19-q-release
> \
> +    "
> +
> +# ASB-2020-06-05_4.19-q-release tag commit
> +SRCREV =3D "ebd43352dd92e56f14a4985a3c99de767fc8f9cf"
> +
> +S =3D "${WORKDIR}/git"
> +
> +LINUX_VERSION ?=3D "${PV}"
> +KERNEL_VERSION_SANITY_SKIP =3D "1"
> +KBRANCH =3D ""
> --
> 2.17.1
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy t=
he
> information in any medium. Thank you.
>
