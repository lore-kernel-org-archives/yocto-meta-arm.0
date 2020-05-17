Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.25619.1589733865080268009
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 17 May 2020 09:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B21140BAC;
	Sun, 17 May 2020 16:44:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Knh_yKBv_F6v; Sun, 17 May 2020 16:44:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4907140A9E;
	Sun, 17 May 2020 16:44:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0EAFF17314B; Sun, 17 May 2020 12:44:23 -0400 (EDT)
Date: Sun, 17 May 2020 12:44:23 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH v2 2/3] optee-client: Add sysVinit service
Message-ID: <20200517164423.GJ11927@denix.org>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>
 <20200515160240.16395-3-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200515160240.16395-3-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2020 at 11:02:39AM -0500, Joshua Watt wrote:
> Adds a sysVinit service to start tee-supplicant so that the optee-client
> package can be used on distros where systemd is not used. Also does some
> cleanup of the recipe including:
>  1) Using @path@ tokens for replacemane in the .service file instead of
>     paths
>  2) Replacing tokens in the .service file after it is installed instead
>     of editing the source file in ${WORKDIR}

Overall looks fine. Quick question - if both sysvinit and systemd are in 
DISTRO_FEATURES - will it start tee-supplicant twice? This was never clear 
to me - I see some recipes go the extra mile to check the DISTRO_FEATURES 
and only install/enable the service accordingly, while some completely rely 
on the corresponding bbclass.


> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../optee/optee-client/tee-supplicant.service |  4 +-
>  .../optee/optee-client/tee-supplicant.sh      | 46 +++++++++++++++++++
>  .../optee/optee-client_git.bb                 | 24 +++++++---
>  3 files changed, 65 insertions(+), 9 deletions(-)
>  create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> index ffb54d3..c273832 100644
> --- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> +++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> @@ -3,8 +3,8 @@ Description=TEE Supplicant
>  
>  [Service]
>  User=root
> -EnvironmentFile=-/etc/default/tee-supplicant
> -ExecStart=/usr/sbin/tee-supplicant $OPTARGS
> +EnvironmentFile=-@sysconfdir@/default/tee-supplicant
> +ExecStart=@sbindir@/tee-supplicant $OPTARGS
>  
>  [Install]
>  WantedBy=basic.target
> diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
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
> +NAME=tee-supplicant
> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
> +DESC="OP-TEE Supplicant"
> +
> +DAEMON=@sbindir@/$NAME
> +
> +test -f $DAEMON || exit 0
> +
> +test -f @sysconfdir@/default/$NAME && . @sysconfdir@/default/$NAME
> +test -f @sysconfdir@/default/rcS && . @sysconfdir@/default/rcS
> +
> +SSD_OPTIONS="--oknodo --quiet --exec $DAEMON -- -d $OPTARGS"
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
> diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
> index ec0826c..a26a799 100644
> --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> @@ -9,19 +9,18 @@ PV = "3.8.0+git${SRCPV}"
>  
>  require optee.inc
>  
> -inherit python3native systemd
> +inherit python3native systemd update-rc.d
>  
>  SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
>  SRC_URI = " \
>      git://github.com/OP-TEE/optee_client.git \
>      file://tee-supplicant.service \
> +    file://tee-supplicant.sh \
>  "
>  
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
>  
> -SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
> -
>  EXTRA_OEMAKE = "O=${B}"
>  
>  do_compile() {
> @@ -42,9 +41,20 @@ do_install() {
>      install -d ${D}${includedir}
>      install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
>  
> -    sed -i -e s:/etc:${sysconfdir}:g \
> -           -e s:/usr/bin:${bindir}:g \
> -              ${WORKDIR}/tee-supplicant.service
> -
>      install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
> +
> +    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
> +
> +    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
> +           -e s:@sbindir@:${sbindir}:g \
> +              ${D}${systemd_system_unitdir}/tee-supplicant.service \
> +              ${D}${sysconfdir}/init.d/tee-supplicant
>  }
> +
> +SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
> +
> +INITSCRIPT_PACKAGES = "${PN}"
> +
> +INITSCRIPT_NAME_${PN} = "tee-supplicant"
> +INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
> +
> -- 
> 2.17.1
> 

> 

