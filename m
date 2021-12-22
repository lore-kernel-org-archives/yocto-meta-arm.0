Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB9DC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 05:10:58 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web09.15837.1640149857776956535
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Dec 2021 21:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=WGxhyYTQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id n15so1254031qta.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Dec 2021 21:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YyBh8wCCnIAI2SkIlZfbC8FlIufWDjp4h8iFvInzNBk=;
        b=WGxhyYTQVcsbP8GUlxvNBDD7eYPu2d7U2GyAIyTFmpn7l0cMLCy62UGXXmI3s08kb+
         f6cCp+AWmwleezYl2UBtB25iANBanhjrongYher+s6Y8AgTwlMfDFMAvmg5O0ACE9gZ7
         8QVA3RLzUBTipLwq+H9pLHTdGh9Mj0a4dpWSiX0fQq9TO0bY5WbG8hjtEp1n4RXr3wT0
         QtinFrT5YTwHcKORuDe/BlaBSh3V+zAtTc19jmVwATgC6SJkBHGtRobOkfLtGqHlSV3U
         zJpJ8sQXusgg1VDzG7AX2gxywJtogWR25cCc1ppuJyil1JBYE4wGwjkt1HjBLztPIF7v
         PCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YyBh8wCCnIAI2SkIlZfbC8FlIufWDjp4h8iFvInzNBk=;
        b=q9SStSGd9BRb9YwqKz8oSZGsXpdzbtllLycfCvMLDzJpr45sWD+euNWI44ZgVwSD/z
         rxA9i/AfFUUi/PsnaSEacN8BcmtEMT/NHTtfBCVK5Irht5926HV3jP27mieTJeZDOsMW
         mO5ZPyAr015WYu6uexeRueBFOhY7pRYENPZ59EaNJlNBlZy7DsEtTnKty+xhpAVEjklk
         2R7JYv205W/nZZ8BKYEdS33nySIhILUTDaXgFqSoWK/BlDuEEsZ9jV7Gbha4Yd+OAW5f
         d1XWzdTZX3S3jo8CFQJUkUJI+WiYCnX4gVXsSqckqqvVEFlLjb47DCGSe8Pj07B8b8wJ
         xn7Q==
X-Gm-Message-State: AOAM5337pJeWYE8llxYiyzTq7pNuCqBIDgEuhDz/sCDmrjnHOhPj7S9v
	BWIo/tkdLPF6g0s62ngtQnuYvNF6uV3Y3y/t
X-Google-Smtp-Source: 
 ABdhPJyz5IMr+LhtgBHHRi05XItDe8GSypEftpinT8uLPM6TG4/Gh3iLxRN/zQCehk+Rif/8r+S3uA==
X-Received: by 2002:a05:622a:549:: with SMTP id
 m9mr1023727qtx.173.1640149856799;
        Tue, 21 Dec 2021 21:10:56 -0800 (PST)
Received: from localhost ([2605:a601:a60f:e00:2d59:d09f:1aeb:71f0])
        by smtp.gmail.com with ESMTPSA id
 f12sm846585qtj.93.2021.12.21.21.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 21:10:56 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	xueliang.zhong@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/secure-partitions: corstone1000: fix SCT
 setVariable() failures
Date: Wed, 22 Dec 2021 00:10:43 -0500
Message-Id: <164014984289.29495.10789972884232682471.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211221185324.3890-1-xueliang.zhong@arm.com>
References: <20211221185324.3890-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Dec 2021 05:10:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2757

On Tue, 21 Dec 2021 18:53:22 +0000, xueliang.zhong@arm.com wrote:
> From: Xueliang Zhong <xueliang.zhong@arm.com>
> 
> 
> This patchset fixes the os_indications setVariable() failure and the SCT
> errors seen for setVariable() and getNextVariableName() functions on
> Corstone1000.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/secure-partitions: corstone1000: Change UID of variable index in SMM
      commit: 2c084144c77c054f9e1358038f20eda31d47f8b4
[2/2] arm-bsp/secure-partitions: Add error cases to setVariable() and getNextVariableName()
      commit: b7b634a788c5615c26e3681be2be68e590a68fcc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

