Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C15C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:25:11 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.109824.1674843901744913606
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=K+nKNhiW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id j9so4771715qtv.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 10:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzASJFl9kGMux5DwyCgoVZPs9nXNZIK9xGL0kvxWY3E=;
        b=K+nKNhiW+acLDCMyXHUiX+9aW0IciNbwnGdfLplR31f+VBz7PBrm1XTsS3yFlOAPM7
         menfbuq7aPsdOjEcpUN7Th9lPwI4unXELreipzxetsjLMFav1bkkaum9XrYUudCoIq0i
         XkudlPkfEVDc85GVHMhaUMiRk/H125XLhVkTH4hzta4qbBLOxc0dC2KHPwI9aCI6ZxDz
         dQnaXHgmUE83CfWOB91pPrCqrDeKpNApyxQf2FloiQw11DoxUYoNHA37vEa4EicjYkAS
         zyWgPEOYSsC5iC0eg+ADyUOLYKQ5xiwtypdgjx2Krv8xhBSLNXpLWh3vswTyrfQwUX+A
         UQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzASJFl9kGMux5DwyCgoVZPs9nXNZIK9xGL0kvxWY3E=;
        b=jFrJ78NIZbk83X6YnuMU9ycE6M8LSibGfcj/ToAV2Pf4h0yI9u7Q8AnND8jsCx1GuH
         B2nXJQJYqwHj4YkkSB3DU72J7CrpOrIuoahOKK7EWSyyDRHh0qhrrFYvu+ivXuHNNX9/
         t7LhSrgZYsgedzPuQQhpoDL737B9qPWXaWIFweKoYIjDKmWE+bjDRsf5+ccb6ZZ1Y4qq
         cnHhBBPGr3XTUhIt9pvI0MUW+ZYZ3aL9OyaFMU5+Wb8a9NElxwkn7bu9hsJP3+xB8fHg
         0vpu4mAUi/GuMdEcx5+lPe3dI5TpWkGdXUYL/MEm/DxWAgyDc1sivALRhZwjX0j4wKoL
         U8Vw==
X-Gm-Message-State: AO0yUKV8ucBnaqWN9FE9QYBzEc5Z5Ng1zF1HPsoItHWlgG4EEp3pSaet
	r0UULHc7d5xiVxUvyFyaWm/NKMYWZ/Cj0s1/
X-Google-Smtp-Source: AK7set+lAPWlV9Raeu0QlV+/Y4uulLwLBvgtw2V8LJu1zGR4A2LOAdnw4IycqtlW/LGlnRd+5KRX9g==
X-Received: by 2002:a05:622a:188a:b0:3b8:2175:fd04 with SMTP id v10-20020a05622a188a00b003b82175fd04mr5524430qtc.32.1674843900385;
        Fri, 27 Jan 2023 10:25:00 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id 139-20020a370891000000b006feea093006sm3243202qki.124.2023.01.27.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:24:59 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH] arm-bsp/firmware-image-juno: Fix deployment of compressed Image
Date: Fri, 27 Jan 2023 13:24:45 -0500
Message-Id: <167484388780.842866.15472646845143575850.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230126193307.154631-1-daniel.diaz@linaro.org>
References: <20230126193307.154631-1-daniel.diaz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:25:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4328

On Thu, 26 Jan 2023 13:33:07 -0600, Daniel Díaz wrote:
> A recent commit compressed the kernel image (to Image.gz) and
> by default enabled an initramfs image. In the case for when
> such that (initramfs) is not desirable, the deploy step of the
> Juno firmware will still try to install the Image file, (not
> Image.gz), so this fails:
> 
>   ERROR: firmware-image-juno-1.0-r0 do_deploy: ExecutionError('/oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/run.do_deploy.360477', 1, None, None)
>   ERROR: Logfile of failure stored in: /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/log.do_deploy.360477
>   Log data follows:
>   | DEBUG: Executing python function sstate_task_prefunc
>   | DEBUG: Python function sstate_task_prefunc finished
>   | DEBUG: Executing shell function do_deploy
>   | cp: cannot stat '/oe/build/tmp-glibc/deploy/images/juno/Image': No such file or directory
>   | WARNING: /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/run.do_deploy.360477:152 exit 1 from 'cp -L -f /oe/build/tmp-glibc/deploy/images/juno/Image /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/image/juno-firmware-19.06/SOFTWARE/'
>   | WARNING: Backtrace (BB generated script):
>   | 	#1: do_deploy, /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/run.do_deploy.360477, line 152
>   | 	#2: main, /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/run.do_deploy.360477, line 163
>   NOTE: recipe firmware-image-juno-1.0-r0: task do_deploy: Failed
>   ERROR: Task (../meta-arm/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb:do_deploy) failed with exit code '1'
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/firmware-image-juno: Fix deployment of compressed Image
      commit: 99b769e6ce4ed722386883a01be6adb7ce18a622

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

