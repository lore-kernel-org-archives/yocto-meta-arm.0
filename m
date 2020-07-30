Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.4009.1596140715476067817
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 13:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=VnVSKglq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id 2so22764138qkf.10
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jul 2020 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QuBl6YRoGz8KHSzzjR0kfui168PqXkfBVHdMZGpkYrs=;
        b=VnVSKglqbdPh9LJpUcYJRSbwwhzlanequwYDODH0xTEofbm/2xEdnDqC2RkCeKNiNO
         YuqjOc1OTt5KcZXqBzSzcm+a+lTg5KnQoCEPvm7oYZS2/2iudR7OMYnR/kJAcdmtpQWc
         SZAOZQAyDRxI38ZewLfuuiTn86CRY6q87stebmZ1PCn4R2tl8XTcJ643ekkgaF5vKIq1
         EWbmSYTDM1ATZFJLWQ4G1m+eCDwZEykxwMKKS71vrT4q30KeDT1/0YKrPMm0OJI02bsM
         2rfQsi92rzockjhS9Zdxu43iYQY2qRSCQdRCUbczox3Ef/6nSN6DEAGWO7HpvUdY9XQ/
         khsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QuBl6YRoGz8KHSzzjR0kfui168PqXkfBVHdMZGpkYrs=;
        b=IPJj+cvwtdaCUN6trRENtq/K4lZP7zfiweCKciKTHn+sLmpuPKVhY74h62tk+/6s6+
         Ja7OCriCThkmYr4op1JI69ZTC4/VxMTf0vYktC06MxZ4c6Lxf7u+c0NGyoJFP3m5XT1h
         7ylv0DHKnFTT3mo7WnP4lUXpaFUj1UCPofS+oUjkxvuuBw4aE/A/N2H+vnqUe+Wwp0L9
         V+pO74A9miIQpWOxZfK8VPt9SLnVfxzMRleGP0CKGI0Z0wHmZtUTIVJgko5gO+YhQYlE
         +CEA5bBypJQM0lP3Iy5NcZ6660PKPMHTkxJQr/IK68T8L+zvW5pbmVt9ebKOjMjze07O
         pw3A==
X-Gm-Message-State: AOAM532jmK1PoyoyGOvA7yX+0mdoFGkIxgX1EH78nPZDq64Dzi264PSz
	de+N4OR+9gUodb467HXYX3oW9A==
X-Google-Smtp-Source: ABdhPJzM6Gi+LeV9gW+8sSu28rjN3WgspPl2/TqLwnHu9zeU8afk5/zwdo4lNJ7yrJFei9hEUJq09Q==
X-Received: by 2002:a05:620a:414e:: with SMTP id k14mr965260qko.374.1596140714540;
        Thu, 30 Jul 2020 13:25:14 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:9dd:6e19:a3fe:5a3c])
        by smtp.gmail.com with ESMTPSA id f189sm4835334qke.15.2020.07.30.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 13:25:14 -0700 (PDT)
Date: Thu, 30 Jul 2020 16:25:12 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/4] arm-autonomy/xen-tools: vif-nat script fixes
Message-ID: <20200730202512.GD15405@kudzu.us>
References: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
 <DA00AFF9-ABC1-4DDD-8FBC-FA5321249324@arm.com>
MIME-Version: 1.0
In-Reply-To: <DA00AFF9-ABC1-4DDD-8FBC-FA5321249324@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 03:55:37PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 30 Jul 2020, at 17:52, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > This patch introduces two fixes for the vif-nat script:
> > 1- Setting the hostname is failing because the "$XENBUS_PATH/domain"
> >   doesn't exist anymore. To fix this we set it to dom$domid.
> > 2- Copy temp files used to add/remove dhcpd configurations to avoid
> >   replacing potential symlinks.
> > 
> > Change-Id: I5f2ed917c15bbe1c6ff9ec3cc9ad2fc4e1c0fb60
> > Issue-Id: SCM-1019
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Series applied to master.

Thanks,
Jon

> 
> > ---
> > .../xen/xen-tools/0001-vif-nat-fix-hostname.patch  | 18 +++++++++
> > .../0002-vif-nat-fix-symlink-removal.patch         | 45 ++++++++++++++++++++++
> > .../recipes-extended/xen/xen-tools_%.bbappend      |  5 +++
> > 3 files changed, 68 insertions(+)
> > create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
> > create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch
> > create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> > 
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
> > new file mode 100644
> > index 0000000..87f25e2
> > --- /dev/null
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
> > @@ -0,0 +1,18 @@
> > +Upstream-Status: Pending
> > +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > +
> > +Setting the hostname is failing because the "$XENBUS_PATH/domain"
> > +doesn't exist anymore. To fix this we set it to dom$domid
> > +
> > +Index: git/tools/hotplug/Linux/vif-nat
> > +===================================================================
> > +--- git.orig/tools/hotplug/Linux/vif-nat
> > ++++ git/tools/hotplug/Linux/vif-nat
> > +@@ -86,6 +86,7 @@ router_ip=$(routing_ip "$ip")
> > + vif_ip=`echo ${ip} | awk -F/ '{print $1}'`
> > + 
> > + hostname=$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '-----')
> > ++[ -z "${hostname}" ] && hostname=dom$domid
> > + if [ "$vifid" != "1" ]
> > + then
> > +   hostname="$hostname-$vifid"
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch
> > new file mode 100644
> > index 0000000..bcd5778
> > --- /dev/null
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch
> > @@ -0,0 +1,45 @@
> > +Upstream-Status: Pending
> > +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > +
> > +Copy temp files used to add/remove dhcpd configurations to avoid
> > +replacing potential symlinks.
> > +
> > +Index: git/tools/hotplug/Linux/vif-nat
> > +===================================================================
> > +--- git.orig/tools/hotplug/Linux/vif-nat
> > ++++ git/tools/hotplug/Linux/vif-nat
> > +@@ -99,7 +100,8 @@ dhcparg_remove_entry()
> > +   then
> > +     rm "$tmpfile"
> > +   else
> > +-    mv "$tmpfile" "$dhcpd_arg_file"
> > ++    cp "$tmpfile" "$dhcpd_arg_file"
> > ++    rm "$tmpfile"
> > +   fi
> > + }
> > + 
> > +@@ -109,11 +111,11 @@ dhcparg_add_entry()
> > +   local tmpfile=$(mktemp)
> > +   # handle Red Hat, SUSE, and Debian styles, with or without quotes
> > +   sed -e 's/^DHCPDARGS="*\([^"]*\)"*/DHCPDARGS="\1'"${dev} "'"/' \
> > +-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> > ++     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
> > +   sed -e 's/^DHCPD_INTERFACE="*\([^"]*\)"*/DHCPD_INTERFACE="\1'"${dev} "'"/' \
> > +-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> > ++     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
> > +   sed -e 's/^INTERFACES="*\([^"]*\)"*/INTERFACES="\1'"${dev} "'"/' \
> > +-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> > ++     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
> > +   rm -f "$tmpfile"
> > + }
> > + 
> > +@@ -125,7 +127,8 @@ dhcp_remove_entry()
> > +   then
> > +     rm "$tmpfile"
> > +   else
> > +-    mv "$tmpfile" "$dhcpd_conf_file"
> > ++    cp "$tmpfile" "$dhcpd_conf_file"
> > ++    rm "$tmpfile"
> > +   fi
> > +   dhcparg_remove_entry
> > + }
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> > new file mode 100644
> > index 0000000..ef8eddd
> > --- /dev/null
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> > @@ -0,0 +1,5 @@
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > +
> > +SRC_URI += "file://0001-vif-nat-fix-hostname.patch \
> > +            file://0002-vif-nat-fix-symlink-removal.patch \
> > +           "
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

