Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F93DC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 17:19:35 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.262.1636996774681880337
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 09:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4kDQAN9L;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id bk22so17627740qkb.6
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 09:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IGLNKyLOffOOlChVgGfUAaPitMBTyun3Z89HAizMezI=;
        b=4kDQAN9LYNr8id61e24CFyzfUkPY3vkYjWOosio6D8Y29b8eP+nrsa8LN+BnEZx37/
         EYKU+8/2e9rBSxymLKzzuetOEVGs/3BPqK1kDRtJc8Cjo2gLfJwmO7oT4n5epRhVVEat
         iGNU07JIkZfYT4etLZZKucONMt4LbCfGvcpsiYcl7TeC97UOjs6AsqgP/js2XoPX5Pml
         OqiaENIZnJIR7WF7dZcsOTUmqNZuvfG+XQPTfUjHCnpeG4Uz6alhgkgxlZx8TWlEne74
         emj4/1dCsj4sIwsihK4+Hv+L9Fym44digJNXMdVN04mDi8pmmrK8j74q6vG7cSn07j1u
         FhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IGLNKyLOffOOlChVgGfUAaPitMBTyun3Z89HAizMezI=;
        b=rFakSK1ly6o43a3IytdeLbSO8cFImg7UxS1Xc56q2OBQ122/ajTIzVnZQYD74j9NJD
         u0VNUBrEe4029+PEl9Th2JDemIOtUwAWkSzsBWr2ar9fUdNnJQJXVIgTbrBvdKLBKG+F
         BlMRurlr0XW98Op9NaqHwPZCrIbfe6U/fe9GVwyj+mMr+1++HEIYOeX8w+X4cJeQmlyG
         eP163ktuUztueNdSvglucy1gd/XUczmLUJO30sSxpEur/b+3XNSqey01ZqEVQabbi1/G
         VoXQHfHV8NbhKW/WDmfwkYcukb1mNn8RZfh+L9ZEQVfiZRoXhYZzN+525Ycd9HuUXqMZ
         vHRw==
X-Gm-Message-State: AOAM533utZLvCjcGX2cu0wKbvv3+4uAQ50CrstjIm0l708IHZIXKULvp
	XWi1PYgQ9floNrcsmIb2OABmaw==
X-Google-Smtp-Source: 
 ABdhPJzVjEy1LLKJqvYpmKHBo/79KMrcDgKqVvRqsVm3V9/6Qs1pdP1vqNci3s4HIJ3IkPQGTia/rQ==
X-Received: by 2002:a37:a693:: with SMTP id p141mr501077qke.269.1636996773845;
        Mon, 15 Nov 2021 09:19:33 -0800 (PST)
Received: from kudzu.us ([2605:a601:a618:1500:6191:7e45:fd06:9a39])
        by smtp.gmail.com with ESMTPSA id
 o17sm7240338qkp.89.2021.11.15.09.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 09:19:33 -0800 (PST)
Date: Mon, 15 Nov 2021 12:19:32 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Subject: Re: [meta-arm] [PATCHv3 4/5] machine/qemuarm64-secureboot.conf: add
 optee-ftpm
Message-ID: <20211115171931.GD31079@kudzu.us>
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
 <20211115140100.24634-4-maxim.uvarov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115140100.24634-4-maxim.uvarov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 17:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2400

On Mon, Nov 15, 2021 at 05:00:59PM +0300, Maxim Uvarov wrote:
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> index c45924a..b664dac 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -20,4 +20,6 @@ WKS_FILE ?= "qemuarm64.wks"
>  WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
>  
> +MACHINE_FEATURES += "optee-ftpm"

I'm wondering if this wouldn't be better described as simply tpm.
Then do a check to see if one is described anywhere and if not, then
do the software tpm.  Does this make sense?

Thanks,
Jon

> +
>  PREFERRED_VERSION_linux-yocto ?= "5.10%"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2388): https://lists.yoctoproject.org/g/meta-arm/message/2388
> Mute This Topic: https://lists.yoctoproject.org/mt/87069392/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


