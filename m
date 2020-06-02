Subject: Re: [PATCH v2] arm-toolchain: merge binary toolchain recipes
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.96.140)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 Jun 2020 23:57:39 -0700
References: <20200602000545.25028-1-jdmason@kudzu.us>
In-Reply-To: <20200602000545.25028-1-jdmason@kudzu.us>
Message-ID: <8876.1591081059371861619@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


> diff --git
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host=
.inc
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host=
.inc
> new file mode 100644
> index 0000000..332ffab
> --- /dev/null
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host=
.inc
> @@ -0,0 +1,26 @@
> +S =3D "${WORKDIR}/${BPN}-${PV}"

As @Ross mentioned, this is already the default value for the S variable.

> +
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +
> +FILES_${PN} =3D "${datadir} ${bindir}"
> +
> +BINNAME =3D "${@d.getVar("BPN").strip("gcc-")}"
> +
> +do_install() {
> +    install -d ${D}${datadir}/${BINNAME}/
> +    cp -r ${S}/. ${D}${datadir}/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/${BINNAME}/bin/${BINNAME}-*; do
> +        lnr $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev file-rdeps"
> +
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.20.1
>=20
>
