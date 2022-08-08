Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5DDC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 19:33:03 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.2910.1659987180757944489
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=QbHxxnvI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id t15so1432948qkg.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=Hzyy7xhU2xSf12BP621BEORuCZ3cN0DuWd2vnNgpMio=;
        b=QbHxxnvI4GoyQPljtHBcDhZHeOgjwuI9YhHSZ6TvMeXNaXwJ9ZOahf7IKSxHcyuo6U
         hPr8U/ccUp89FY6Z8RAJRRG/+1ZtxUPi/ggX2SahwYr72ljf+aafHRGv9+7pjF+1OAHm
         fe1CTsSOOFIJg6GdFG9YZflUaaJejttL+qPj5k0BYlGLh94KW//5ZrYKQknetDGfQsod
         iBAPdOIRDcVJubpbwyaYZX/T+tdT7YaSV1vfGjY6WJ8Y8QOSyTXU6DScBtncB1ohxJXo
         6dXUkJWRbkoO9fWIzCzx6ox85uZwa3wj7eaICgcrW3xT4P0hKeLq5pHzc8zNUcoPJ87D
         /y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=Hzyy7xhU2xSf12BP621BEORuCZ3cN0DuWd2vnNgpMio=;
        b=lHNAs1LwUMp3Ld1efHCSayB+VcHuZH1sefxWX9QIHBopqCB+9FqgFDjZ6+9UthPLm/
         3O5P2g17GsKR3aV5lJgtab46PYHssE93MRd9X9u2Ijos2fFMVTRauDWxvxJ9ng9HnvcQ
         9MvfPN/kw6vjt5OC20j4BFU6ewa9/09AV6nAg05+JLb84eu67pgvfdV9LdYjHm/OdyT6
         eSsEHwGxpHSPf+z2bSRO+rdQPlA5OMJsDKHMi6BdV+MTr4ir7FECy87uvwsx4ikEcDA3
         VPTXf2+rEWYAl0LiYi1dVvPs8iYyHZW9aYSW4c5B9M0ixauzamSZUrsOpTG+IxDQqAge
         9Rxw==
X-Gm-Message-State: ACgBeo0FmJdH/wz/tvp3ufJrLE4WJJuWJGlvUl3ALFeeRjGNEGh1MPSi
	/bTpLrbNphEBpyPkq6hrMvs71jGdgRNc0g==
X-Google-Smtp-Source: 
 AA6agR4kR/2h28MIfFmdDCvjMRmc3txNfK3JBPKsZkdknP6BL0j8q3hqu2lZozxCI/aSZGbJVrJj2Q==
X-Received: by 2002:a05:620a:3727:b0:6b8:d74b:5d88 with SMTP id
 de39-20020a05620a372700b006b8d74b5d88mr14966923qkb.98.1659987179315;
        Mon, 08 Aug 2022 12:32:59 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w4-20020a05620a424400b006b8d1914504sm10555802qko.22.2022.08.08.12.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 12:32:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"changqing.li@windriver.com" <changqing.li@windriver.com>
Subject: Re: [kirkstone][meta-arm][PATCH] optee.inc: update setting for
 OPTEE_ARCH
Date: Mon,  8 Aug 2022 15:32:09 -0400
Message-Id: <165998712992.2694645.8654203922664331867.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802062807.4039040-1-changqing.li@windriver.com>
References: <20220802062807.4039040-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Aug 2022 19:33:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3656

On Tue, 2 Aug 2022 14:28:07 +0800, changqing.li@windriver.com wrote:
> lib32-optee-os do_compile failed since OPTEE_ARCH is not set correctly.
> In file included from lib/libutee/include/link.h:9,
>                  from lib/libutee/arch/arm/tcb.c:37:
> lib/libutee/include/elf.h:67:2: error: #error Unknown architecture
>    67 | #error Unknown architecture
>       |  ^~~~~
> In file included from lib/libutee/arch/arm/tcb.c:37:
> lib/libutee/include/link.h:13:9: error: unknown type name 'Elf_Addr'
>    13 |         Elf_Addr dlpi_addr;                     /* module relocation base */

Applied, thanks!

[1/1] optee.inc: update setting for OPTEE_ARCH
      commit: 653754d7913a566b16773b8a4925d4ae96456077

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

