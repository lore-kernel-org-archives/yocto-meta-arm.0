Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.18401.1590344980498968376
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 24 May 2020 11:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F00B340BEF
	for <meta-arm@lists.yoctoproject.org>; Sun, 24 May 2020 18:29:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRd6q8zshQng for <meta-arm@lists.yoctoproject.org>;
	Sun, 24 May 2020 18:29:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2F5E40A35
	for <meta-arm@lists.yoctoproject.org>; Sun, 24 May 2020 18:29:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ABE07173205; Sun, 24 May 2020 14:29:39 -0400 (EDT)
Date: Sun, 24 May 2020 14:29:39 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v3 2/3] optee-client: Add sysVinit service
Message-ID: <20200524182939.GH17660@denix.org>
References: <20200521142259.15363-3-JPEWhacker@gmail.com>
 <23538.1590132052696879724@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <23538.1590132052696879724@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2020 at 12:20:52AM -0700, Diego Sueiro wrote:
> On Thu, May 21, 2020 at 03:23 PM, Joshua Watt wrote:
> 
> >
> > Adds a sysVinit service to start tee-supplicant so that the optee-client
> > package can be used on distros where systemd is not used. Also does some
> > cleanup of the recipe including:
> >  1) Using @path@ tokens for replacemane in the .service file instead of
> >     paths
> >  2) Replacing tokens in the .service file after it is installed instead
> >     of editing the source file in ${WORKDIR}
> > 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> > ---
> >  .../optee/optee-client/tee-supplicant.service |  4 +-
> >  .../optee/optee-client/tee-supplicant.sh      | 46 +++++++++++++++++++
> >  .../optee/optee-client_git.bb                 | 24 +++++++---
> >  3 files changed, 65 insertions(+), 9 deletions(-)
> >  create mode 100644
> > meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
> > 
> > diff --git
> > a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> > b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> > index ffb54d3..c273832 100644
> > --- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> > +++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> > @@ -3,8 +3,8 @@ Description=TEE Supplicant
> >
> >  [Service]
> >  User=root
> > -EnvironmentFile=-/etc/default/tee-supplicant
> > -ExecStart=/usr/sbin/tee-supplicant $OPTARGS
> > +EnvironmentFile=-@sysconfdir@/default/tee-supplicant
> > +ExecStart=@sbindir@/tee-supplicant $OPTARGS
> >
> >  [Install]
> >  WantedBy=basic.target
> > diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
> > b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
> > new file mode 100644
> > index 0000000..b4d2195
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
> > @@ -0,0 +1,46 @@
> > +#!/bin/sh
> > +
> > +# Source function library
> > +. /etc/init.d/functions
> > +
> > +NAME=tee-supplicant
> > +PATH=/sbin:/bin:/usr/sbin:/usr/bin
> > +DESC="OP-TEE Supplicant"
> > +
> > +DAEMON=@sbindir@/$NAME
> > +
> > +test -f $DAEMON || exit 0
> > +
> > +test -f @sysconfdir@/default/$NAME && . @sysconfdir@/default/$NAME
> > +test -f @sysconfdir@/default/rcS && . @sysconfdir@/default/rcS
> > +
> > +SSD_OPTIONS="--oknodo --quiet --exec $DAEMON -- -d $OPTARGS"
> > +
> > +set -e
> > +
> > +case $1 in
> > +    start)
> > +	    echo -n "Starting $DESC: "
> > +	    start-stop-daemon --start $SSD_OPTIONS
> > +        echo "${DAEMON##*/}."
> > +        ;;
> > +    stop)
> > +	    echo -n "Stopping $DESC: "
> > +	    start-stop-daemon --stop $SSD_OPTIONS
> > +        echo "${DAEMON##*/}."
> > +        ;;
> > +    restart|force-reload)
> > +	    $0 stop
> > +	    sleep 1
> > +	    $0 start
> > +        ;;
> > +    status)
> > +        status ${DAEMON} || exit $?
> > +        ;;
> > +    *)
> > +        echo "Usage: $0 {start|stop|restart|force-reload|status}" >&2
> > +        exit 1
> > +        ;;
> > +esac
> > +
> > +exit 0
> > diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb
> > b/meta-arm/recipes-security/optee/optee-client_git.bb
> > index 64d7d57..5dbbfe9 100644
> > --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> > @@ -9,19 +9,18 @@ PV = "3.8.0+git${SRCPV}"
> >
> >  require optee.inc
> >
> > -inherit python3native systemd
> > +inherit python3native systemd update-rc.d
> >
> >  SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
> >  SRC_URI = " \
> >      git://github.com/OP-TEE/optee_client.git \
> >      file://tee-supplicant.service \
> > +    file://tee-supplicant.sh \
> >  "
> >
> >  S = "${WORKDIR}/git"
> >  B = "${WORKDIR}/build"
> >
> > -SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
> > -
> >  EXTRA_OEMAKE = "O=${B}"
> >
> >  do_compile() {
> > @@ -43,9 +42,20 @@ do_install() {
> >      install -d ${D}${includedir}
> >      install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
> >
> > -    sed -i -e s:/etc:${sysconfdir}:g \
> > -           -e s:/usr/bin:${bindir}:g \
> > -              ${WORKDIR}/tee-supplicant.service
> > -
> >      install -D -p -m0644 ${WORKDIR}/tee-supplicant.service
> > ${D}${systemd_system_unitdir}/tee-supplicant.service
> > +
> > +    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh
> > ${D}${sysconfdir}/init.d/tee-supplicant
> > +
> > +    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
> > +           -e s:@sbindir@:${sbindir}:g \
> > +              ${D}${systemd_system_unitdir}/tee-supplicant.service \
> > +              ${D}${sysconfdir}/init.d/tee-supplicant
> >  }
> > +
> > +SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
> > +
> > +INITSCRIPT_PACKAGES = "${PN}"
> > +
> > +INITSCRIPT_NAME_${PN} = "tee-supplicant"
> > +INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
> > +
> > -- 
> > 2.17.1
> > 
> >

> 

