Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7149C636CD
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 10:00:06 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.25967.1675591206152505453
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Feb 2023 02:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=50hAg+jT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id h24so9997407qta.12
        for <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 02:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9T99tuxa/rHIuH0jk3yuFMIzAXyCdHGjAZT1RihYzs=;
        b=50hAg+jTssDkiayXHGnd1KA22D7Nr4RlmKTr+17w27XPqNn1fFJO02SwXQXJva0iUR
         UUAlo6Cgeb1YK8Bv0Kna3c4zcb1XmMxQyw086emKzUz8nPir5/VU+UT0kBdtf+AcW9cp
         Qq/tv8cec049RiVvIl9kq8dH8v+t7wSibDlxx68k5ao1YNTWEyMebOf387mgj4xIuhDm
         JwAAWhiDp9p3tzqVlw0W5yM2DBztcM/eVVhFwlJo0AkTzX+v+p6A0xGcVUxPet0V9NJI
         WAi89A9G4+TGoKObyBxZzpiPoVOTJCt3Cf7ytaKQMQRnmzyh48Q9O0/LGtOahObIJRVI
         l6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9T99tuxa/rHIuH0jk3yuFMIzAXyCdHGjAZT1RihYzs=;
        b=2HL8sSUOQvaKmeWgeMCFq3E26LHT/bvcjJNXP8ZvtHg4YtsUSPf4GgMl7adNRLaEjc
         Xh93d8qUY+rU5kFSrm1FeHFAxC7ztC+dtcsPpb2Hj3e6o08M6rKRd+7oP05jEUCNFxMa
         ryDFJMSwDMJbG0C02ovPvYIk6JU0rCSQwL/sBg5Wby34ShwKwwBIqhPMS18duRbDO9U5
         olNmEGB5/Nwzn7JGL7nKNdK2WVfFweFK91IgMp3uBcKq/R9GS1LqvvLYXBGOd+ZyvZ9D
         5pYhCPNUgakK5I+pL4LKlKBeF/76kERvDm/B+WCuHd7+pcM+YRsDtjIdI3S9hqCX9PZC
         qyjQ==
X-Gm-Message-State: AO0yUKVqgOxIeVEi/UQuuusfWlot9GF9FnIETwn8x+r0YI9qgGgp19wF
	+FCm4qqx1LTBg3VsnbpL68i9lC8g882V0FSz0kQ=
X-Google-Smtp-Source: AK7set8eGQIGoCDptisSHuFcf5HAdhTy0uw28OdFFluxSTrNtC7SqaegZQyYRZQYhzCVcsYGEHyi/A==
X-Received: by 2002:ac8:5845:0:b0:3b9:a652:4ca0 with SMTP id h5-20020ac85845000000b003b9a6524ca0mr29396411qth.13.1675591204685;
        Sun, 05 Feb 2023 02:00:04 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id h13-20020ac8714d000000b003b9dca4cdf4sm5030624qtp.83.2023.02.05.02.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 02:00:04 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH] arm-bsp/firmware-image-juno: Fix deployment of compressed Image
Date: Sun,  5 Feb 2023 04:59:52 -0500
Message-Id: <167559119199.1745921.18128853607791230201.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230126193307.154631-1-daniel.diaz@linaro.org>
References: <20230126193307.154631-1-daniel.diaz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 10:00:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4360

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
      commit: b004c61ec2306f3f4976e21c33cd846d9cd98c52

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

