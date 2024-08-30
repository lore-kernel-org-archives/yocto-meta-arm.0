Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DAECA1006
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 15:42:19 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.19723.1725032530126731386
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 08:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=pEl3IZzm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7a8197d82a9so32841585a.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725032529; x=1725637329; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tudUnmexlA0DxVufvtfb6MTl1YmEnr4t51pK2eUCgko=;
        b=pEl3IZzmOqtO2WnGXt9lF8r7JrkXzLnc/jMbpu/8mVO2P+n7dKBGeVQ283IPSQCvVZ
         M0UXuA6VhmjF9CiBzwpsPsW66HJk7FQJvzGbbmkO5ffeAFNu7DHET8D1OXiSNpiNCpnI
         tYAuuoXpwYXn7ES7ZGd6n6EnBuau2afqUZ47eeP9s7koklIlhMqe6fsX0ttxydYgurrn
         yJdovW+asx6J5bVW7mTCkI/2hH5WsHU37SPV2J7Xjtk5VGRQ1N8bLFcMFMWkJM79qpgq
         eI6DY0dkpmbGRcj4oBV6QJLtXs7pJDQkaFDaKbmuKEXadmJwRexNb4JFj3l++3fBidOz
         evSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725032529; x=1725637329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tudUnmexlA0DxVufvtfb6MTl1YmEnr4t51pK2eUCgko=;
        b=sFCfsN86pAyPQKLA9X7m3c2ZExdCaYKiIKRczT++7QVVNWcXIcWprEHJ8SBnsYrM8y
         1CBl43Xj7durkjxHuGnQHwigRSTL+MFHUNSBvR0+c85AleZLNYphVYTSgUT8VWDp50af
         4BThz06FVgazqaUHQyDdZxuNjUN0qBpxErtuit8F1n2/y6i+qa7fdni2IPGX3+spUlYk
         72F7eQy9zDgFTJCaThjLaekBgZkH1WwffDaAvK0M0wmRzEz2Dzpj7PT0Xn/H6xSjylBG
         kkw/03GbTZquJpz2L8QdK1X7Vh/iM/qMryMl5apLEPs5DPPdqhnRj8fbnVYKSsQ6H7Io
         P/+w==
X-Gm-Message-State: AOJu0YzGfIJIkdEpnMGZvIFDrDbEmfW7kTQqWhDNdQ3JtdsFoTkfcnW5
	HBip5EhEBhKoU9wZV2wAeFNWouGhEZ/+ds+2Amd6K4u478eGW4spWYaWmT6peQ==
X-Google-Smtp-Source: AGHT+IGIo8hyslbgjBmY9BM8TYVNEPFHrZ5b4IIny8zO4hsSd+tC7HEiipdDp8XP7lcgIWoZtZKb5Q==
X-Received: by 2002:a05:620a:448d:b0:7a6:675e:8603 with SMTP id af79cd13be357-7a8041cc910mr831809885a.28.1725032528764;
        Fri, 30 Aug 2024 08:42:08 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806c5c7c5sm153846085a.63.2024.08.30.08.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:42:08 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:42:06 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 01/13] qemuarm64-secureboot: Introduce uefi-secureboot
 machine feature
Message-ID: <ZtHoTtrr2rIzIaG-@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-2-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-2-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 15:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6040

On Thu, Aug 29, 2024 at 10:31:57AM -0600, Javier Tia wrote:
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  meta-arm/conf/machine/qemuarm64-secureboot.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> index 78a39c03..2483c4ac 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -22,3 +22,4 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
>  
>  MACHINE_FEATURES += "optee-ftpm"
> +MACHINE_FEATURES += "uefi-secureboot"

This should be squashed into another patch.  I'm thinking there should
really just be 3.  

1.  Add support for UEFI secure boot to all of the packages (kernel,
u-boot, etc)
2.  add systemd (if it is really needed)
3.  Add support for UEFI secure boot to qemuarm64-secureboot

With an overall philosophy of "Each patch should do 1 unique thing and
be git bisectable".  As they are now, they are not in a bisectable
order, and are so small that I have to go back-and-forth between the
emails to understand the concepts and make sure there is nothing
missing overall.  I apologize for not saying this in prior revisions,
but per my previous email, I don't really look at patches until they
pass CI.

Thanks,
Jon

> -- 
> 2.46.0
> 
> 

