Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F9BC4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 13:45:38 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.7449.1665755134254989272
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 06:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=mxM93Ths;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id a5so2439787qkl.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqEyXpJ6X6CgCJgkvqoRh6Tsbv7oemXtNUVtNjZW9n8=;
        b=mxM93ThsKkCXbYWpGqV3iznZ3rCmyZPeIC8ol/jTQ2+JFp/HYQ8dXjCD5JD/noPK30
         +Rht/n6eDaMkDoJGLd953RF7rTjRyWNqt/V33gz5DFKXqnINNGJ0vAymoMGTxRTzwunO
         q8GinU0O9DLsf7BrC6hihQqtZ6MbY9oBlIEfJbFA5u42f8CSfH11Co+vlRzuab0wpbyu
         5ybiANjjVQYu2fu4BtyVK+VHx47ckuHCY1OhlKb0ESGBG4xXB9nrf03++sQcdtQLO5ce
         1itv9i2siiam8jn/Asj92vECAGuDDDdv8ctLxbiyewh6hWUgcvkCqPwxAcQPtaRkh9qA
         Ju6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqEyXpJ6X6CgCJgkvqoRh6Tsbv7oemXtNUVtNjZW9n8=;
        b=dh/CqiuDmk5zcs9yOo8h2sOb7l02mSiiE9vhqTtQFdWl2fqAFnFaYO1c+cWjipsyc7
         exG5ss26tkQKNIjRU4jt5IGGLsU47exRUMgCrx8FuTRs1V5Modd868g8b3DcchvYk8yG
         596vuapZldPVJZuVgpzIWVBaen/UIV1KJpWQao/WHPhawi8SSkwCBHns9BDbbL51XEOK
         FWyXJhkLCbp9Ju9AWholog56gurTZ7jR/Ciogl5w3ucg9YYMw7pFJozM8uZ/t1+pq4BE
         KJUnII7Hmn01IZv3Iu1kX3jDtN8sRCxBqzp8MCpQ9u3m2bbuCsgAfVFWOHadgkAI55BK
         JEVA==
X-Gm-Message-State: ACrzQf2SuhLoY8kp/hhaMVBxBKdR9oaLOra7va0ld2grQw0zNhiZTrl0
	ZiXy3siWwnqrm3rDdhFWXbPHz+mfjnhofQ==
X-Google-Smtp-Source: AMsMyM7v1rmy4lbkGbqB75DFhQbOlgXB7Cv0z7ekjmodjzYhyd6WYK0kpUlmQmLx8ytbkG8HjUJoyQ==
X-Received: by 2002:a05:620a:2988:b0:6ce:cc3f:73b9 with SMTP id r8-20020a05620a298800b006cecc3f73b9mr3748338qkp.9.1665755132872;
        Fri, 14 Oct 2022 06:45:32 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id n1-20020a05620a294100b006ee949b8051sm2569319qkp.51.2022.10.14.06.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 06:45:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"mohamed.omarasaker@arm.com" <mohamed.omarasaker@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/4] arm-bsp/corstone1000: add partial esrt support
Date: Fri, 14 Oct 2022 09:44:51 -0400
Message-Id: <166575509232.1155326.18021828248140829096.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221014110251.1766159-1-mohamed.omarasaker@arm.com>
References: <20221014110251.1766159-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 13:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3970

On Fri, 14 Oct 2022 12:02:47 +0100, mohamed.omarasaker@arm.com wrote:
> Add esrt support in u-boot and TFM
> 
> Satish Kumar (4):
>   arm-bsp/u-boot: corstone1000: esrt support
>   arm-bsp/trusted-firmware-m: corstone1000: bump tfm SHA
>   arm-bsp/trusted-firmware-m: corstone1000: fix sournce dir of libmetal
>     and openamp
>   arm-bsp/trusted-firmware-m: corstone1000: secure debug code checkout
>     from yocto
> 
> [...]

Applied, thanks!

[1/4] arm-bsp/u-boot: corstone1000: esrt support
      commit: 60af2fc05334e13f38cdd8ff906ff12a2277dbcb
[2/4] arm-bsp/trusted-firmware-m: corstone1000: bump tfm SHA
      commit: 81181ed89818474bc6887b0383b4311099d482ca
[3/4] arm-bsp/trusted-firmware-m: corstone1000: fix sournce dir of libmetal and openamp
      commit: 0f49cad85fe69431d7de1a881e7fcbab51b70aa1
[4/4] arm-bsp/trusted-firmware-m: corstone1000: secure debug code checkout from yocto
      commit: 37ba0b162a363ec2884511b4994f36b48873df48

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

