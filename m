Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D41C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:38 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.110.1664478091761691063
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Ipi+hWKk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id j10so1372455qtv.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vsczlYldUn6G4Rqt4IFZjv03u/C9rbhNT4CR1JOf5Gk=;
        b=Ipi+hWKkRi4kYqp63Sd2enpaIWpAigj2EVLOMcWBMql0/20oZ3cAq4RCCD05YJOVMw
         v8Xf6dMwbK20MkdVB1ezGdMDlgnh9deJ1+iE2twDLCxU8a9sJ/isrgVcb2O1BPbrJplA
         lORSX6DdwsnpCZCEcmMm5IgBwZPDZWR1Fq8+hdT11kkfmCqpmXicsnDQd324XcM4n4zk
         nrEmCyb6IRsmnBGJ9ki/d42QwTWZ4Nsvlsr6xph+tzYAvrSiJ7YcJ84msFF2BJAbMMvE
         Du5E+uTnjtWP0zJjuAstRM0gp3pfHw/T9e3shbICm3AZsIHgZp0jk7WD33loJ3toEpT0
         iPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vsczlYldUn6G4Rqt4IFZjv03u/C9rbhNT4CR1JOf5Gk=;
        b=ZOx2axnXutuKhZNGhxy11t/b7PGugan/OAJPj+rZYjCLYUrH1c9EFQSHolHlXxYzzh
         Ei+ITMQXGKs3zm398a/HreMSFjFzB8JWeIY/O0iGdEX5olQiXdB4aFlblWC2GnRRoh2k
         wCIiFUY99HuNys1++kdKnTnKcEcBsYBaYX1r3B/0NkcdfLaI8CDS2kQEt7ZC6H8Clkli
         kbFfj4IEDyJQONa5RxlqSdqi5RTT8y7rZnd5U6QKAmKgMtW+Hqb1IhABQPOsVFBJO/FS
         n8YOuS+rDp9paWVn8ToRqPBEaaGYpqDne+WS///iWbWE81JDHoX9xoYRni2SeGlK6JgN
         kLPA==
X-Gm-Message-State: ACrzQf0bAYBNZlGq+ZI5udGJuvNKn93sbrLXa13XUZHqH62vrETzTeyT
	YhpAq+V+P/VLBEB1AEX4eJn0nHsbafmeMxWI
X-Google-Smtp-Source: 
 AMsMyM6p9IUZPtcQT6Qh7SS8h4Ydszmh059C0hThZ0+/nC/nhplXIOJOl0BYLdIZh8pZJCTaLbMCiA==
X-Received: by 2002:ac8:7c43:0:b0:35c:cd8f:3da5 with SMTP id
 o3-20020ac87c43000000b0035ccd8f3da5mr3766225qtv.61.1664478090442;
        Thu, 29 Sep 2022 12:01:30 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm163562qkp.106.2022.09.29.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:01:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Adding a test application for external system
Date: Thu, 29 Sep 2022 14:56:30 -0400
Message-Id: <166447779548.3284601.15304688668129762516.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926121521.35674-1-emekcan.aras@arm.com>
References: <20220926121521.35674-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 19:01:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3873

On Mon, 26 Sep 2022 13:15:19 +0100, emekcan.aras@arm.com wrote:
> Adds a linux userspace test application and a recipe to test
> external system in corstone1000 platform.
> 
> Emekcan (2):
>   arm-bsp/test: Adding a test app for external system
>   arm-bsp/images: Adding external system test to initramfs image
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/test: Adding a test app for external system
      commit: 037011da6490fd34e7a9f29c1eca3056ef5d904c
[2/2] arm-bsp/images: Adding external system test to initramfs image
      commit: 4a190f18def7355699fd5c4fc8657dead5b07e84

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

