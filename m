Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.12210.1608042069517372606
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 06:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=2QfbfCwS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id y15so14572986qtv.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 06:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EAwZEfV6c7DjPaZJyZrKuTIK0jxj1Ikyi7LjtlU2xHc=;
        b=2QfbfCwSD37yZykW+514HyREv0LNzzROswxnw+MHOzaNILTjwbTND7vWphB0MRwGA+
         0U3nK2T+ItdhmjmyIlgJwk3dhdE/BaZKPPpS66Iy+AOfLeFbeCyRgPYs0Q4KAvEnnf4z
         Fh66o3ZFmKaExZ2Wf0h3s4uVWCZZYuvbyoeo8vvqrgOZdhMsvDd/rHasMtvTY/ZsZ6wI
         mTTX3khW7NZPdsPtSJXB1aYAivSB7wCd/wh+W8RG5CY2XJLRgrUmS4eIcKm2+XHeVv4N
         DcBhe6KYaviS08b1QqvIqEq0k9hKWpNTkm5nnxEOAqMVI0vWSxQZ1e8LfFPyzh3FfGd5
         RuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EAwZEfV6c7DjPaZJyZrKuTIK0jxj1Ikyi7LjtlU2xHc=;
        b=cnVPPrvgggJG6d8F/3Vun2yv3IkqFlhTUGVlid8P+SUZKZ4GKpvJAUG7XhYkRd2unl
         GDCcOdN/LyRQMlYSGV8nDjHYDiJz34YhTmjXHFAhFaLsQKckJjCxPLUzgs1uu1Rn2Scq
         cv7P5S/RBFHK+rcVV/ikhGI2wtosPaGL6AjqXHKt3ehFBVtkRFd1c9md6GKraovrvagf
         fZRN/kdWT0GtAZ+xZXl5rpfePxeNQjxHfRQ2nJzE1v0xjAGbrLgJl3i1si3/o0Ix0M7X
         E0kal0sNAemKhIW4FyngccbDBdNH8bFO5jAZ0KQBuENSHXF9i0FlrEsUp9ff5Fl1Ek45
         S4WQ==
X-Gm-Message-State: AOAM533Qbj/BXLIqpxL/6kmmSM4ofrQzEAeX2aJEGssMTPH7LT1RmcZt
	vZGRL9zvaFQuSqGZ0PgR8CrqRQ==
X-Google-Smtp-Source: ABdhPJxatW1P16CoXvAZO+yykuLi5dyQRIOerOK6WL9LGV1gjEn5DFxff/ZpLGi2DFMy1ZLsd/GqBA==
X-Received: by 2002:ac8:4692:: with SMTP id g18mr37343453qto.255.1608042068656;
        Tue, 15 Dec 2020 06:21:08 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:4438:99f1:e83e:f284])
        by smtp.gmail.com with ESMTPSA id b4sm15457745qtb.33.2020.12.15.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 06:21:08 -0800 (PST)
Date: Tue, 15 Dec 2020 09:21:06 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Henry Wang <Henry.Wang@arm.com>
Cc: meta-arm@lists.yoctoproject.org, diego.sueiro@arm.com,
	Michael.Zhao@arm.com, Kaly.Xin@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/container: Add a recipe to include container image
Message-ID: <20201215142106.GB20024@kudzu.us>
References: <20201215040655.3411553-1-Henry.Wang@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201215040655.3411553-1-Henry.Wang@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 12:06:55PM +0800, Henry Wang wrote:
> This commit implements a generic recipe to pack and import
> container image to the xenguest image.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Issue-Id: SCM-1738
> Change-Id: I239b360f9a7dd1cdc050d46a40e210406ca21aae

Applied to master.

Thanks,
Jon

> ---
>  .../files/import_container.sh                 | 39 +++++++++
>  .../import-docker-image.bb                    | 79 +++++++++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100755 meta-arm-autonomy/recipes-containers/import-docker-image/files/import_container.sh
>  create mode 100644 meta-arm-autonomy/recipes-containers/import-docker-image/import-docker-image.bb
> 
> diff --git a/meta-arm-autonomy/recipes-containers/import-docker-image/files/import_container.sh b/meta-arm-autonomy/recipes-containers/import-docker-image/files/import_container.sh
> new file mode 100755
> index 0000000..a7646b3
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-containers/import-docker-image/files/import_container.sh
> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +
> +CONTAINER_IMAGE_FILE="###CONTAINER_IMAGE_FILE###"
> +CONTAINER_IMAGE_NAME_AND_TAG="###CONTAINER_IMAGE_NAME_AND_TAG###"
> +CONTAINER_IMAGE_FILE_KEEP="###CONTAINER_IMAGE_FILE_KEEP###"
> +
> +has_docker_image() {
> +    docker image inspect "$1" >/dev/null 2>&1
> +}
> +
> +start() {
> +    # Image does not exist and image file exists: Import the image.
> +    if ! has_docker_image ${CONTAINER_IMAGE_NAME_AND_TAG} && \
> +       [ -f "/usr/share/docker/images/${CONTAINER_IMAGE_FILE}" ]; then
> +        echo "Importing ${CONTAINER_IMAGE_NAME_AND_TAG} container image..."
> +        docker import \
> +               /usr/share/docker/images/${CONTAINER_IMAGE_FILE} \
> +               ${CONTAINER_IMAGE_NAME_AND_TAG} 2>&1 || {
> +            echo "Import ${CONTAINER_IMAGE_NAME_AND_TAG} container image: Failed."
> +            exit $?
> +        }
> +        echo "Import ${CONTAINER_IMAGE_NAME_AND_TAG} container image: Done."
> +
> +        if [ "${CONTAINER_IMAGE_FILE_KEEP}" != "1" ]; then
> +            rm /usr/share/docker/images/${CONTAINER_IMAGE_FILE}
> +        fi
> +    fi
> +}
> +
> +case "$1" in
> +    start)
> +        start && exit 0
> +        ;;
> +    *)
> +        echo "Usage: $0 {start}"
> +        exit 2
> +esac
> +
> +exit $?
> diff --git a/meta-arm-autonomy/recipes-containers/import-docker-image/import-docker-image.bb b/meta-arm-autonomy/recipes-containers/import-docker-image/import-docker-image.bb
> new file mode 100644
> index 0000000..cdd76d5
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-containers/import-docker-image/import-docker-image.bb
> @@ -0,0 +1,79 @@
> +#
> +# This recipe imports a docker container image to the xenguest image
> +# Notes:
> +# - Users should add docker in the local.conf of their target with
> +# DISTRO_FEATURES += " docker" to make sure docker is installed.
> +# - The CONTAINER_IMAGE_FILE variable defines the docker
> +# container image to be imported and should be set in local.conf.
> +# - The CONTAINER_IMAGE_FILE_KEEP variable defines the
> +# behaviour that if the container image file is kept after import.
> +# Setting this variable to 1 means keep the container image file after
> +# import. This variable can be set in local.conf.
> +# - The CONTAINER_IMAGE_NAME_AND_TAG variable defines the name and
> +# tag of the imported image. The value of this variable should follow
> +# the format of `NAME:TAG`. This variable can be set in local.conf.
> +#
> +
> +DESCRIPTION = "Import a docker image to xenguest"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +CONTAINER_IMAGE_FILE ??= ""
> +CONTAINER_IMAGE_FILE_KEEP ??= ""
> +CONTAINER_IMAGE_NAME_AND_TAG ??= "local:local"
> +
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES = "docker"
> +
> +python __anonymous() {
> +    # Check if `CONTAINER_IMAGE_FILE` is empty.
> +    container_image_file = d.getVar('CONTAINER_IMAGE_FILE')
> +    if not container_image_file:
> +        raise bb.parse.SkipRecipe("CONTAINER_IMAGE_FILE is empty")
> +
> +    # In case we have a symlink we need to convert the link to its realpath.
> +    if os.path.islink(container_image_file):
> +        container_image_file = os.path.realpath(container_image_file)
> +        bb.warn("Given CONTAINER_IMAGE_FILE: %s is a symlink, "
> +                "convert the link to its realpath: %s" %
> +                (d.getVar('CONTAINER_IMAGE_FILE'), container_image_file))
> +        d.setVar('CONTAINER_IMAGE_FILE', container_image_file)
> +
> +    # Check if the container image file exists.
> +    # The container image file here is either the real file or the symlink target.
> +    if not os.path.exists(container_image_file):
> +        raise bb.parse.SkipRecipe("CONTAINER_IMAGE_FILE: %s does not exist." %
> +                                  container_image_file)
> +
> +    # Here we can ensure that the CONTAINER_IMAGE_FILE exists and is valid.
> +    # Therefore we can append this file to SRC_URI.
> +    d.appendVar('SRC_URI',  ' file://' + container_image_file + ';unpack=0')
> +}
> +
> +S = "${WORKDIR}"
> +SRC_URI = "file://import_container.sh"
> +
> +inherit update-rc.d
> +INITSCRIPT_PARAMS = "start 30 2 3 4 5 ."
> +INITSCRIPT_NAME = "import_container.sh"
> +
> +do_install() {
> +    install -d ${D}${sysconfdir}/init.d
> +    install -d -m 755 ${D}${datadir}/docker/images
> +
> +    install -m 777 ${CONTAINER_IMAGE_FILE} ${D}${datadir}/docker/images/.
> +    install -m 755 import_container.sh ${D}${sysconfdir}/init.d
> +
> +    BASENAME_CONTAINER_IMAGE_FILE=$(basename "${CONTAINER_IMAGE_FILE}")
> +
> +    sed -i "s,###CONTAINER_IMAGE_FILE###,${BASENAME_CONTAINER_IMAGE_FILE}," \
> +           ${D}${sysconfdir}/init.d/import_container.sh
> +    sed -i "s,###CONTAINER_IMAGE_NAME_AND_TAG###,${CONTAINER_IMAGE_NAME_AND_TAG}," \
> +           ${D}${sysconfdir}/init.d/import_container.sh
> +    sed -i "s,###CONTAINER_IMAGE_FILE_KEEP###,${CONTAINER_IMAGE_FILE_KEEP}," \
> +           ${D}${sysconfdir}/init.d/import_container.sh
> +}
> +
> +FILES_${PN} += "${datadir}/docker/images"
> +RDEPENDS_${PN} = "packagegroup-docker-runtime-minimal"
> -- 
> 2.25.1
> 

> 
> 
> 

