Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.557.1589315391417455582
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 13:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=iGDl/VUo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id a136so6145073qkg.6
        for <meta-arm@lists.yoctoproject.org>; Tue, 12 May 2020 13:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xk6GuuGHJ/uyTayR93USaD2bjzGXjkkBPwWOwB9zQSM=;
        b=iGDl/VUors8VfdGgTv8cosDV7GNakE3Yt6orGem7wQ8FasxzhaABvpFO16j92zy40C
         iirnzCfItKrfNGqMPdDlmCQirsBAbYyLhaDGtmcD3siBiFPgA1FO+J/7UONWH9T1+MiS
         AyWVhcZQmKTqVyXLy+sfqMQ/HgzM0ySSctXsVum+ZbdRNX7v/4uL9/LqTBj+bDpVzm5t
         l/WbNp08+Puyn+q0q3O0mtXiTJburwbcS6N1gqo9/GwOK1YvjnPoRzGEyRThQ+JOkzKs
         tLPBsJdOZn38Fvp5ky2ABFQ7jS1SlUKv5lxALRyPv8eo/+L7I9oVRngBZACleHjYtkLz
         XDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xk6GuuGHJ/uyTayR93USaD2bjzGXjkkBPwWOwB9zQSM=;
        b=RfZinWZS9X2M8lplt2DS87Q17Z5aRIuYRo12SyCUACqLLUP+czZQcglKIKbRcaeBD+
         +xhDeASHesDHPAfpkaco9GHQgyclRAifmGVZiWMVxhOj42drNBTaRpDJb6aqKOFniDl5
         ceon2LECBj1GMEBebj96uxzRqnX11L0g6LtZ2qRGyqnsNULVwBXBZ33+ih73fMTyZxxI
         DoJEhQOgeFDd1Us6dYeDPkJx0GRB7tmc8IlFksyJcE2UNVE4vdvE2Ors+TPz0Nv4kHTV
         vVTabaJ7pUrle9ldlF8EiHJ+qe8QW+5Z5yUfWI8f029wCMG4s2mnowkq/hvKYugM2gpv
         RyaQ==
X-Gm-Message-State: AGi0PubLl6MKMPmdKlZOB5oXix60gR6OkcJE/GQbrkxvOYGd8Xn7H9cE
	OGMHUEEW8+ODdWMVqn4p90LvvW+w3kD8VA==
X-Google-Smtp-Source: APiQypJ+5XxrChhjKQZ1lM24+HDo+Sw5h+KOu8hj7Bwm50Mq4BJkA5CqMzmwfN8d95dfEdCDiOExEA==
X-Received: by 2002:a05:620a:b0b:: with SMTP id t11mr23301266qkg.103.1589315390592;
        Tue, 12 May 2020 13:29:50 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:adef:f2fb:7e3e:86da])
        by smtp.gmail.com with ESMTPSA id i82sm12096543qke.134.2020.05.12.13.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:29:50 -0700 (PDT)
Date: Tue, 12 May 2020 16:29:48 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: n1sdp: linux-linaro-arm: Disable CONFIG_EXTRA_FIRMWARE
Message-ID: <20200512202948.GC27993@kudzu.us>
References: <1589298995-67540-1-git-send-email-diego.sueiro@arm.com>
 <FC013D47-F00F-40ED-854F-545C503E9BC1@arm.com>
MIME-Version: 1.0
In-Reply-To: <FC013D47-F00F-40ED-854F-545C503E9BC1@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2020 at 04:37:15PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 12 May 2020, at 16:56, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > We don't want to build firmware blobs into the kernel binary. Also,
> > add linux-firmware-rtl8168 package to MACHINE_ESSENTIAL_EXTRA_RDEPENDS
> > to have it installed in any image by default.
> > 
> > Change-Id: If8a88a4ccbc6d474438a2555498989695a4b19dc
> > Issue-Id: SCM-954
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled in to the master branch.

Thanks,
Jon

> 
> > ---
> > meta-arm-bsp/conf/machine/n1sdp.conf                                   | 3 +++
> > .../linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg              | 2 ++
> > meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend        | 1 +
> > 3 files changed, 6 insertions(+)
> > create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
> > 
> > diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> > index b19fb86..5fddcad 100644
> > --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> > +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> > @@ -18,3 +18,6 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
> > # Use kernel provided by linaro (Contains support for SCMi or HDMI)
> > PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
> > PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
> > +
> > +# RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
> > +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
> > new file mode 100644
> > index 0000000..35afddd
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
> > @@ -0,0 +1,2 @@
> > +# We don't want to build firmware blobs into the kernel binary
> > +CONFIG_EXTRA_FIRMWARE=""
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> > index 9634d43..0f516c7 100644
> > --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> > @@ -11,6 +11,7 @@ SRC_URI_append_n1sdp = " \
> >     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
> >     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
> >     file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
> > +    file://disable-extra-fw.cfg \
> >     "
> > 
> > # Referring to commit TAG N1SDP-2020.03.26
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

