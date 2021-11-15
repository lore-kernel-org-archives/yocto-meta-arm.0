Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3296C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 16:52:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.365.1636995164999000122
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 08:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=tE0C+k9w;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id 8so6556258qtx.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 08:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JIqRdVyi5lSrtY9Gdkd01rWVwFY3ZCWYtgGVDtHzDjc=;
        b=tE0C+k9wmZg0PNXz7g0rC3godN3cd9pAJ/jipmg5B+vbLcJraF+xyo313xOmm99oRE
         LSdl1qZMXAnuox7YdKdyubluTai4f6HqTUm8Iga96o8xfcm+mV8OgPUZAu9e33R1XqxO
         gLq3XUREZVVviepPlGAzlhYhadZibekPfX3nJGu7gd8vDM6mKLQUxI7L3JvBm3zYdzWs
         eGt/ZDIYWN6jyg1FRVwxij5dkMzXcfpsURJKmG5wRUept6Fgwt0N+ggzSL2PGRsmUvq2
         FaT7p/61kJgjufaoznu/NSnbge7v/mIfry9mUNJYdrv4z/MHXvt4MBuhuiy6OaWPUkQn
         lAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JIqRdVyi5lSrtY9Gdkd01rWVwFY3ZCWYtgGVDtHzDjc=;
        b=IfNoplo1yEXT7F8FyqWwWQr3h0FyidHVqRx5xfuTvj5DKsvfNR8hPjkjKqMk2Ni8Lc
         ohyeXxUFGXgdM6AWsdO+7CjLTE/dCM4x9vYEVvaLPtARGujahtQkXuCoY97naCCnUD0+
         ytWZ4hab2ZCDvE5URQz+PvkNEDjmHIw9FS1XzKlZDb3OYUXbzIY+YDEObw5gmZEznA8y
         PExWWAL+gdFQCBTbM0R1jEawVy/C6x4kyKHNyAV06fMxGwkXEKvhDfEY4Wq6KD8D42zk
         hJbTKz9dSKCyq3IUmN9rnJAtlGchYvA1jpB26z3c76eSRliuoqZ/w22TuH7dp5rftTLF
         qmfA==
X-Gm-Message-State: AOAM530c3/AMP3+jUuOHG/CvPmhzC6UnS5NxT5u24CMFrHHtK9N60W12
	uNfZHTkV3PzxU/XlkeD5lkGspA==
X-Google-Smtp-Source: 
 ABdhPJwOgTuse3ipmoP47tdmUADmllvTjIEs8g+ska7kBvs6DAh6oEKPTeSaVZltVDOP3UEHhvjvmQ==
X-Received: by 2002:a05:622a:1741:: with SMTP id
 l1mr459553qtk.24.1636995164190;
        Mon, 15 Nov 2021 08:52:44 -0800 (PST)
Received: from kudzu.us ([2605:a601:a618:1500:6191:7e45:fd06:9a39])
        by smtp.gmail.com with ESMTPSA id
 l2sm7914469qtk.41.2021.11.15.08.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 08:52:44 -0800 (PST)
Date: Mon, 15 Nov 2021 11:52:42 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Subject: Re: [meta-arm] [PATCHv3 3/5] ci/qemuarm64-secureboot.yml: add optee
 and tf-a
Message-ID: <20211115165242.GB31079@kudzu.us>
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
 <20211115140100.24634-3-maxim.uvarov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115140100.24634-3-maxim.uvarov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 16:52:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2398

On Mon, Nov 15, 2021 at 05:00:58PM +0300, Maxim Uvarov wrote:
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  ci/qemuarm64-secureboot.yml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
> index b7f3cb4..a7e89d4 100644
> --- a/ci/qemuarm64-secureboot.yml
> +++ b/ci/qemuarm64-secureboot.yml
> @@ -14,3 +14,5 @@ target:
>    - core-image-base
>    - perf
>    - optee-examples
> +  - optee-os
> +  - trusted-firmware-a

I don't think we should be added tf-a or optee-os as a target.  tf-a is
already being built as a dependency of the machine, and optee-os is a
dependency of tf-a for qemu machines.  So, this is not adding
anything, and I think the patch should be dropped.

Thanks,
Jon

> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2386): https://lists.yoctoproject.org/g/meta-arm/message/2386
> Mute This Topic: https://lists.yoctoproject.org/mt/87069390/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


