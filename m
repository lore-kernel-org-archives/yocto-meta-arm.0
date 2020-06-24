Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.1666.1593023984670374406
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 11:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Yp9PKS5s;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id h23so2556764qtr.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Jun 2020 11:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mc2Pehko6a04tSk0yZnlyHqI1uIWGKllwjyl2TACWtI=;
        b=Yp9PKS5sPE3B7gFSBHrCbNBmNXEVhyXnA4DgkwvGi9mzqhRw4OrwvubYAgrkNEQiwU
         6ePrdAp2jSCnLw63MWIw9OQ61oxQ9byCXr4tZ8d2X+r9JoqEVDmtQTPaT/9f5HsxNmDf
         PgbD4uTa6qGrvKzMckyPKpyolhFOkTIwhP/rPlPeL5aC0uiAnYy7q6Hf/QhNO4jYiyE+
         2Qy7J8kkV/kdTNqMGmR4jfo/uWTXE3Kv4yhN5sy5L0n38PWg5nhJTb9GXZxbwYHFQtXO
         WU7E/qIwGMbsCJEl1DJwrgwTBzKaPiySU/NddVNtjN8/xwkvUcieY+4huS6yRP6ejW7v
         6ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mc2Pehko6a04tSk0yZnlyHqI1uIWGKllwjyl2TACWtI=;
        b=Vej9wUWa4MNCELmeEjixoN/AfL/AB2n2Ckhq4hfF36cVoVEy+8EFbcHZR3IdMDcOgs
         I6y2DqWbgccxEIr06E6rE9eHrEm+bhYm/iKY3qPtxpWvoCwRGP2dZVdi4oYNP1kyGNU+
         Abi5g8rn90PlCJH1Hph4JQn3TO85T6diWoGOddNW3Ew/5wv2FapHxjRXRb99MWq1l0iI
         pxvzulfWtqfHVf+bH688Z81d8qZAz4/ZGsWg4KYevbzAXbwaRqkUGSTZLVZifqmy1fwn
         YAaHql/gTWioBE0lREtreL2/Tqx/HwDqfSO1XrMXehkxxVGnDB+RuF/vg4fedAhAeqVc
         lKkQ==
X-Gm-Message-State: AOAM533PkT3STP54N1R/UcQuAuuZW6uVD9HJ+3DiYwS+WE80slxnR5Na
	fnPDgdrSsU9B/XJBPk1jVj2avQ==
X-Google-Smtp-Source: ABdhPJyC3oLX+xox9Yy6zXT1eMpgCEE5yxqbba8M4OjfWc43E1e63jknPTlrlXsAK7msXVeR9LrJow==
X-Received: by 2002:aed:208c:: with SMTP id 12mr14489315qtb.286.1593023983801;
        Wed, 24 Jun 2020 11:39:43 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:cc98:88db:f64a:7953])
        by smtp.gmail.com with ESMTPSA id n143sm4117964qkn.94.2020.06.24.11.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 11:39:43 -0700 (PDT)
Date: Wed, 24 Jun 2020 14:39:41 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/fiptool : provides fiptool for packaging
Message-ID: <20200624183940.GA5282@kudzu.us>
References: <20200622141612.4814-1-khasim.mohammed@arm.com>
 <14975.1592895937470124128@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <14975.1592895937470124128@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2020 at 12:05:37AM -0700, Diego Sueiro wrote:
> On Mon, Jun 22, 2020 at 03:16 PM, Khasim Mohammed wrote:
> 
> >
> > Firmware Image Package (FIP), is a packaging format used
> > by TF-A to package the firmware images in a single binary,
> > this tool is used to package the binaries in FIP format.
> > 
> > Change-Id: Ie4108915c5d63be340d6f53148a6dff03d6d48e7
> > Issue-Id: PLATFORMS-3134
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> 
> > ---
> >  .../fiptool/fiptool-native_2.3.bb             | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
> > 
> > diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
> > b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
> > new file mode 100644
> > index 0000000..25ca111
> > --- /dev/null
> > +++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
> > @@ -0,0 +1,29 @@
> > +# Firmware Image Package (FIP)
> > +# It is a packaging format used by TF-A to package the
> > +# firmware images in a single binary.
> > +
> > +DESCRIPTION = "fiptool - Trusted Firmware tool for packaging"
> > +LICENSE = "BSD-3-Clause"
> > +
> > +SRC_URI =
> > "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;destsuffix=fiptool-${PV};protocol=https;"
> > +LIC_FILES_CHKSUM =
> > "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> > +
> > +# Use fiptool from TF-A v2.3
> > +SRCREV = "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
> > +
> > +DEPENDS += "openssl-native"
> > +
> > +inherit native
> > +
> > +do_compile () {
> > +    # These changes are needed to have the fiptool compiling and executing
> > properly
> > +    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
> > +    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},'
> > ${S}/tools/fiptool/Makefile
> > +
> > +    oe_runmake fiptool
> > +}
> > +
> > +do_install () {
> > +    install -d ${D}${bindir}/
> > +    install -m 0755 tools/fiptool/fiptool ${D}${bindir}
> > +}
> > -- 
> > 2.17.1
> > 
> >

> 

