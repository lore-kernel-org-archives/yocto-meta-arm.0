Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.1623.1593024008160014010
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 11:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Yt0EQ215;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id h23so2557822qtr.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Jun 2020 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a1ZiP9tFG9/8epRQgFOzAXRzI8KxptCVQ0iquY74gDU=;
        b=Yt0EQ215qDVcytXRd63qlhh9HSa/NhmEg+pRpAjdrXGY/V28ZECu6b2RZGnhW59oQy
         F5PJnqhLPIAK1y7b7zLAdjAEe9PNAHUmOVV2Tel6FVf+uzUGjgQ03lMsSRCbNhDTOHd7
         krMBnPqaCJ5fKfYgwS008mxeKBHgnXPlKNHUDtwz5EUPcHex3ecLI6m8SlKHrSdT7K4d
         V1RGoZEATBdbAErFOJ7yEDXJU2+o8SEJtP5yCVJ7LqYfh+A8v1/zkBika3ZgptjQdoce
         XUG6FDyOuIPWqYsJKYQWB9Ly7AM4E+VjfpvC50FCswsPQNJypxoy9ZTO3tNr6QH6QedM
         6iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a1ZiP9tFG9/8epRQgFOzAXRzI8KxptCVQ0iquY74gDU=;
        b=nvlfJnNYMaS98jv0BsgSDLRUc8RJkSZnsUEl/NkC4+oWkDx7I++epwCJP7j31hOz1D
         6sjAlhCcscvsxWbbZ8rf0Kr6RC6Fm5Rpp9LUHBAYl6HvnvN+NazcQJl/04Z4cF53Udvs
         J4q4VNNdTCq5yYwm7DjIVG1CqcIMCXHwWVmW2wphXlovfaMsPGXZxpekGdikiW9ks+xv
         3NIpUfDTF8qmTZzMC+6g90MZzGdpPfKZh9u6ep3Pu3meYPhEl6/xFs5KqSXp7lcTXvhR
         +o7ZO3nxsJtuaQZyW49YL534YVDrLu8FIgED/yeDHwaE4pRv6wwcnThVGho/GcC9tqs7
         tI0Q==
X-Gm-Message-State: AOAM532l77WRIfbqnZZg/SE4hl8a+kNKUiFEl/V/brZhZ2XN93CCFwUp
	AjfOZ+fJYj1GOo7yI7pYpEfFmB5xIqKYrQ==
X-Google-Smtp-Source: ABdhPJzlssZDGxrubm5e9o7AhJfB0XP4K+kna4XRPQvP9RUIP+6Ghuy/Q+/ZM5xR3VnqaqBo1bLzew==
X-Received: by 2002:ac8:895:: with SMTP id v21mr28350993qth.185.1593024007313;
        Wed, 24 Jun 2020 11:40:07 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:cc98:88db:f64a:7953])
        by smtp.gmail.com with ESMTPSA id w28sm1831591qkw.92.2020.06.24.11.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 11:40:06 -0700 (PDT)
Date: Wed, 24 Jun 2020 14:40:05 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/2] arm-bsp/scp-firmware: Build SCP MCP firmware for N1SDP
Message-ID: <20200624184004.GB5282@kudzu.us>
References: <20200622141735.4951-2-khasim.mohammed@arm.com>
 <10477.1592895947964152071@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <10477.1592895947964152071@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2020 at 12:05:47AM -0700, Diego Sueiro wrote:
> On Mon, Jun 22, 2020 at 03:18 PM, Khasim Mohammed wrote:
> 
> >
> > - Add bbappend recipe to build SCP and MCP firmware
> >   for N1SDP.
> > - Use fiptool to package the binary images
> > - Update machine conf to add image dependency
> >   for SCP-firmware components
> > 
> > Issue-Id: PLATFORMS-3134
> > 
> > Change-Id: I24bb427179f2fdee0a8351257c9088d8024ca6b8
> > Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> 
> > ---
> >  meta-arm-bsp/conf/machine/n1sdp.conf          |  1 +
> >  .../scp-firmware/scp-firmware-n1sdp.inc       | 32 +++++++++++++++++++
> >  .../scp-firmware/scp-firmware_git.bbappend    |  7 ++++
> >  3 files changed, 40 insertions(+)
> >  create mode 100644
> > meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> >  create mode 100644
> > meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> > 
> > diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf
> > b/meta-arm-bsp/conf/machine/n1sdp.conf
> > index 20eaf27..755bb09 100644
> > --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> > +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> > @@ -27,6 +27,7 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=
> > "trusted-firmware-a"
> >  PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
> >
> >  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
> > +EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
> >
> >  #UEFI EDK2 firmware
> >  EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
> > diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> > b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> > new file mode 100644
> > index 0000000..ddbaac4
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> > @@ -0,0 +1,32 @@
> > +# N1SDP specific SCP configurations and build instructions
> > +
> > +SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> > +SRCREV_cmsis  = "refs/tags/5.2.0"
> > +SCP_PLATFORM  = "n1sdp"
> > +SCP_LOG_LEVEL = "INFO"
> > +
> > +COMPATIBLE_MACHINE_n1sdp = "n1sdp"
> > +
> > +PV = "2.6+git${SRCPV}"
> > +
> > +DEPENDS += "fiptool-native"
> > +DEPENDS += "virtual/trusted-firmware-a"
> > +
> > +do_install_append() {
> > +   fiptool \
> > +       create \
> > +       --scp-fw "${D}/firmware/scp_ramfw.bin" \
> > +       --soc-fw "${RECIPE_SYSROOT}/firmware/bl31.bin" \
> > +       "scp_fw.bin"
> > +
> > +   fiptool \
> > +       create \
> > +       --blob
> > uuid=54464222-a4cf-4bf8-b1b6-cee7dade539e,file="${D}/firmware/mcp_ramfw.bin" \
> > +       "mcp_fw.bin"
> > +
> > +   install "scp_fw.bin" "${D}/firmware/scp_fw.bin"
> > +   install "mcp_fw.bin" "${D}/firmware/mcp_fw.bin"
> > +
> > +   ln -sf "scp_romfw.bin" "${D}/firmware/scp_rom.bin"
> > +   ln -sf "mcp_romfw.bin" "${D}/firmware/mcp_rom.bin"
> > +}
> > diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> > b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> > new file mode 100644
> > index 0000000..53bd022
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> > @@ -0,0 +1,7 @@
> > +# Include machine specific SCP configurations
> > +
> > +MACHINE_SCP_REQUIRE ?= ""
> > +
> > +MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
> > +
> > +require ${MACHINE_SCP_REQUIRE}
> > -- 
> > 2.17.1
> > 
> >

> 

