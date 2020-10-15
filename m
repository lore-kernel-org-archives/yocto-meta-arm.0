Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.17266.1602781001624401814
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 09:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Wj8/vjVl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.196, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f196.google.com with SMTP id j17so2202215ilr.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 15 Oct 2020 09:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XjZfVlubZVueuiSJav5hNkdJH8Lx7xYLGVp5NZrj1VY=;
        b=Wj8/vjVlyC3mDh/Hxqqd8gq2qQiAE6bn4/qblerWDr8M9cN7r+i4FZh+/Xx6wbo8Rk
         ZZRxXysAkAD5imc2DFv6xQRNmAxkvknDH1JN0Ui9xy+AZe39bfAmmMPr9N3eocJXBMFq
         9JEuJqPG+zx/PJN8VqPtpYJ9uGieyiXhx2PbuCpfR0dpcIAdY1t3ZFWaTDCggfGkvFU+
         30sQXb5eeQrvpSzg3u2FUiF69ofWl+BCaohdcGQ5VgX5n2W88VbyUdoWmYQbSDqGOiPz
         njGb3OYzVFkyKWzqqWJTMThjykx787HiGV8M405rGMIvGbrCwCvHcBMOi8S3BST9ZkCt
         tBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XjZfVlubZVueuiSJav5hNkdJH8Lx7xYLGVp5NZrj1VY=;
        b=LUg/XSrsXk11sajHxXtaEzil9+TYXf7bpGyCQnL4v2ArH1gyfYorOh4QTHl31FoY8g
         17rqP0dVSiMqbv/8ZcL6fIJKvT1aCebkmIckMgw82W1xbBjcE3aflsHcf+Jx2diNwI/J
         Hs2AMprc1S0hv4Ee6i896IpRa6gEXgkUBhIs7MRfuohqdi8LdvSNRFvhtkeOeOA4tB4d
         mzNYAgURFdXhIoz7g1okeALjOthfEdZDVrLjhZMT8WYkFcD1/gLztNHph9wHt+RJ1ypk
         4d+n1FP/ljQx4f6myC2agTp8Le29zdXOzfQO/8/xO7NTJhO3Uuofn6DKr8r/UPN/QD0D
         85Sg==
X-Gm-Message-State: AOAM531W++yYOY7qjV+nQmQAzlqZt/+iFGF1rtsX2uv7Ie93IZCS3Pez
	/j/pHz6U2qrmeRfyHL4tsjplLQ==
X-Google-Smtp-Source: ABdhPJwxFCqcxG0f4SYT9AeHYDi/ltWnY8heh4gqUhCefxHFl8wGMzNH6UAiluIjBOGbY7sfBASYpA==
X-Received: by 2002:a92:180b:: with SMTP id 11mr3788439ily.89.1602781000918;
        Thu, 15 Oct 2020 09:56:40 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id i2sm2974978ils.41.2020.10.15.09.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 09:56:40 -0700 (PDT)
Date: Thu, 15 Oct 2020 12:56:35 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-mkimage: add extra ramdisk support
Message-ID: <20201015165635.GA9521@kudzu.us>
References: <20201014115426.2608-1-kamil.dziezyk@arm.com>
 <5151.1602676965297044761@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <5151.1602676965297044761@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2020 at 05:02:45AM -0700, Diego Sueiro wrote:
> On Wed, Oct 14, 2020 at 12:55 PM, Kamil Dziezyk wrote:
> 
> >
> > Some guest images requires a ramdisk, that is built with a custom recipe.
> > This patch adds an option '--xen-ramdisk',
> > for xenguest-mkimage script to cover that.
> > Extra ramdisk support is also added to xenguest-image-extra bbclass,
> > via 'XENGUEST_EXTRA_RAMDISK' variable.
> > 
> > Issue-Id: SCM-1276
> > Change-Id: I8ec74a37c0c96ca83a3489911186f3b3262f80fd
> > Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> 
> > ---
> >  .../classes/xenguest-image-extra.bbclass        | 12 ++++++++++++
> >  .../documentation/xenguest-mkimage.md           |  2 ++
> >  .../xenguest/files/xenguest-mkimage             | 17 +++++++++++++++++
> >  3 files changed, 31 insertions(+)
> > 
> > diff --git a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> > b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> > index 502a083..533b973 100644
> > --- a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> > +++ b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> > @@ -12,6 +12,11 @@ inherit xenguest-image
> >  # recipes, the last recipe setting it will prevail.
> >  XENGUEST_EXTRA_DTB ??= ""
> >
> > +# Add a ramdisk file for the guest
> > +# Only one file should be added, if this is set multiple times or in several
> > +# recipes, the last recipe setting it will prevail.
> > +XENGUEST_EXTRA_RAMDISK ??= ""
> > +
> >  # Append something to the guest xen configuration
> >  # All files here will be merged together in the final xen configuration
> >  # This can contain several files or be used in several recipes
> > @@ -49,6 +54,13 @@ do_deploy_append() {
> >          call_xenguest_mkimage partial --xen-device-tree=${XENGUEST_EXTRA_DTB}
> >      fi
> >
> > +    if [ -n "${XENGUEST_EXTRA_RAMDISK}" ]; then
> > +        if [ ! -f ${XENGUEST_EXTRA_RAMDISK} ]; then
> > +            die "xenguest-image: DTB file ${XENGUEST_EXTRA_RAMDISK} does not
> > exist"
> > +        fi
> > +        call_xenguest_mkimage partial --xen-ramdisk=${XENGUEST_EXTRA_RAMDISK}
> > +    fi
> > +
> >      if [ -n "${XENGUEST_EXTRA_XENCONFIG}" ]; then
> >          for f in ${XENGUEST_EXTRA_XENCONFIG}; do
> >              if [ ! -f $f ]; then
> > diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md
> > b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> > index 3dcc28b..ece17f7 100644
> > --- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
> > +++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> > @@ -99,6 +99,8 @@ For a detailed help on available operations, please use:
> >    times to add several command line options.
> >  - --xen-device-tree=FILE: add dtb FILE as device tree. This both adding the
> >    file to the image and modifying the xen configuration to use it.
> > +- --xen-ramdisk=FILE: add ramdisk FILE as guest ramdisk. This both adding the
> > +  file to the image and modifying the xen configuration to use it.
> >  - --init-script=FILE: add guest init script. The script is embedded inside
> > the
> >    image file. Several script can be added and the basename of FILE is used to
> >    distinguish them (calling the option twice with the same file will update
> > the
> > diff --git
> > a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> > b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> > index 4c1b4a8..a3f987a 100755
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> > @@ -82,6 +82,9 @@ Xen configuration for the guest
> >  --xen-device-tree=      disable device tree parameter in xen configuration
> >  --xen-device-tree=FILE  set guest device tree in xen configuration and add
> >                           file to xen files
> > +--xen-ramdisk=          disable ramdisk parameter in xen configuration
> > +--xen-ramdisk=FILE      set guest ramdisk in xen configuration and add
> > +                         file to xen files
> >  --xen-disk=             disable disk parameter in xen configuration
> >  --xen-disk=DEV          set guest disk to device DEV (phy:DEV,xvda,w is set)
> >  --xen-append=FILE       append FILE content to xen configuration
> > @@ -668,6 +671,20 @@ for arg in "${@}"; do
> >                  install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/guest.dtb
> >              fi
> >              ;;
> > +        --xen-ramdisk=*)
> > +            if [ -z "${optarg}" ]; then
> > +                xen_config_disable_param "ramdisk"
> > +                rm -f ${IMAGE_TMPDIR}/files/ramdisk.img
> > +            else
> > +                if [ ! -f ${optarg} ]; then
> > +                    echo "Error: invalid ramdisk file ${optarg}"
> > +                    exit 1
> > +                fi
> > +                xen_config_set_string "ramdisk" "files/ramdisk.img"
> > +                mkdir -p ${IMAGE_TMPDIR}/files
> > +                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/ramdisk.img
> > +            fi
> > +            ;;
> >          --xen-disk=*)
> >              if [ -z "${optarg}" ]; then
> >                  xen_config_disable_param "disk"
> > -- 
> > 2.17.1
> > 
> >

> 
> 
> 

