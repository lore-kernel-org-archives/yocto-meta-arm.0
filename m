Subject: Re: [PATCH v3 2/3] optee-client: Add sysVinit service
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.99.251)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 22 May 2020 00:20:52 -0700
References: <20200521142259.15363-3-JPEWhacker@gmail.com>
In-Reply-To: <20200521142259.15363-3-JPEWhacker@gmail.com>
Message-ID: <23538.1590132052696879724@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 03:23 PM, Joshua Watt wrote:

>
> Adds a sysVinit service to start tee-supplicant so that the optee-client
> package can be used on distros where systemd is not used. Also does some
> cleanup of the recipe including:
>  1) Using @path@ tokens for replacemane in the .service file instead of
>     paths
>  2) Replacing tokens in the .service file after it is installed instead
>     of editing the source file in ${WORKDIR}
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../optee/optee-client/tee-supplicant.service |  4 +-
>  .../optee/optee-client/tee-supplicant.sh      | 46 +++++++++++++++++++
>  .../optee/optee-client_git.bb                 | 24 +++++++---
>  3 files changed, 65 insertions(+), 9 deletions(-)
>  create mode 100644
> meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
>=20
> diff --git
> a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> index ffb54d3..c273832 100644
> --- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.servic=
e
> +++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.servic=
e
> @@ -3,8 +3,8 @@ Description=3DTEE Supplicant
>  
>  [Service]
>  User=3Droot
> -EnvironmentFile=3D-/etc/default/tee-supplicant
> -ExecStart=3D/usr/sbin/tee-supplicant $OPTARGS
> +EnvironmentFile=3D-@sysconfdir@/default/tee-supplicant
> +ExecStart=3D@sbindir@/tee-supplicant $OPTARGS
>  
>  [Install]
>  WantedBy=3Dbasic.target
> diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant=
.sh
> b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
> new file mode 100644
> index 0000000..b4d2195
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
> @@ -0,0 +1,46 @@
> +#!/bin/sh
> +
> +# Source function library
> +. /etc/init.d/functions
> +
> +NAME=3Dtee-supplicant
> +PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
> +DESC=3D"OP-TEE Supplicant"
> +
> +DAEMON=3D@sbindir@/$NAME
> +
> +test -f $DAEMON || exit 0
> +
> +test -f @sysconfdir@/default/$NAME && . @sysconfdir@/default/$NAME
> +test -f @sysconfdir@/default/rcS && . @sysconfdir@/default/rcS
> +
> +SSD_OPTIONS=3D"--oknodo --quiet --exec $DAEMON -- -d $OPTARGS"
> +
> +set -e
> +
> +case $1 in
> +    start)
> +	    echo -n "Starting $DESC: "
> +	    start-stop-daemon --start $SSD_OPTIONS
> +        echo "${DAEMON##*/}."
> +        ;;
> +    stop)
> +	    echo -n "Stopping $DESC: "
> +	    start-stop-daemon --stop $SSD_OPTIONS
> +        echo "${DAEMON##*/}."
> +        ;;
> +    restart|force-reload)
> +	    $0 stop
> +	    sleep 1
> +	    $0 start
> +        ;;
> +    status)
> +        status ${DAEMON} || exit $?
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|restart|force-reload|status}" >&2
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb
> b/meta-arm/recipes-security/optee/optee-client_git.bb
> index 64d7d57..5dbbfe9 100644
> --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> @@ -9,19 +9,18 @@ PV =3D "3.8.0+git${SRCPV}"
>  
>  require optee.inc
>  
> -inherit python3native systemd
> +inherit python3native systemd update-rc.d
>  
>  SRCREV =3D "be4fa2e36f717f03ca46e574aa66f697a897d090"
>  SRC_URI =3D " \
>      git://github.com/OP-TEE/optee_client.git \
>      file://tee-supplicant.service \
> +    file://tee-supplicant.sh \
>  "
>  
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build"
>  
> -SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
> -
>  EXTRA_OEMAKE =3D "O=3D${B}"
>  
>  do_compile() {
> @@ -43,9 +42,20 @@ do_install() {
>      install -d ${D}${includedir}
>      install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
>  
> -    sed -i -e s:/etc:${sysconfdir}:g \
> -           -e s:/usr/bin:${bindir}:g \
> -              ${WORKDIR}/tee-supplicant.service
> -
>      install -D -p -m0644 ${WORKDIR}/tee-supplicant.service
> ${D}${systemd_system_unitdir}/tee-supplicant.service
> +
> +    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh
> ${D}${sysconfdir}/init.d/tee-supplicant
> +
> +    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
> +           -e s:@sbindir@:${sbindir}:g \
> +              ${D}${systemd_system_unitdir}/tee-supplicant.service \
> +              ${D}${sysconfdir}/init.d/tee-supplicant
>  }
> +
> +SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
> +
> +INITSCRIPT_PACKAGES =3D "${PN}"
> +
> +INITSCRIPT_NAME_${PN} =3D "tee-supplicant"
> +INITSCRIPT_PARAMS_${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."
> +
> --=20
> 2.17.1
>=20
>
