Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F53CC25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 01:35:28 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.11714.1660527314432671311
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 18:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=CwlXJoGS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id h21so4647236qta.3
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 18:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=oc0744V20AV6eyTUaPOQTHQkER+he7MLQOkkD9DwXX4=;
        b=CwlXJoGSdPlFgSODbsMBDb01JmtR4MZ+RpT4AZtrAuHN9LdywCiCENfMrcseRw+mNs
         jE9sBDbzXq85cTa8oBDivH4532ELugijyu8qsgm+fK4OemvGV0DDPRLwCwWn7GVvpsv/
         wRUdecVO1DtXAr4EpyEJGD8hXIwrEd0xwg4TcgbTVwJUW971NGfu43PWwZi1NzG55/e6
         MqE8eEw2b/pdU5GYtfx+izZqgPUrI+ktxEKdGEy5V410uajC1A8SMWreVxpli/HLlRIf
         Ot8uqrBjw4BXFkhu5glx/Wmy5cqSqQ6MXi8jXn5lbYTNcU5nmtTPZbIIHi0sF7Doync+
         6UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=oc0744V20AV6eyTUaPOQTHQkER+he7MLQOkkD9DwXX4=;
        b=bA4yO7mY08YlnKbyAhkpPpExedVirZKjSOanmhZwm1LzNZxTO+ojicoLUOdm9hphTC
         HvwR2n3UYgS/oB3nupfeRjTQC8PxtqkkXwtQBdawYgGnyIw49SELDD/cMGZ4XaAQl0jt
         n75CfDYvVwHXlnPD75ITvWgxwozNwbD/LfMwC9IWz9Kq/1l9n+ULv1ud2nHANHeliSps
         FVQi1cCP9lAox0X0/6MNTs2AaNLqc2RdqnWj+5RQ8SR4Ftvj/YJxjAouh8dhtNHgjWVQ
         AuvIfcVdqkll0N4sD5McgpSH2kRiCKWPiI1SJwOr0PJAdlWmiE2OEvNR4+O9c9yxq8Vm
         FrGw==
X-Gm-Message-State: ACgBeo1iRmI9kY0XxEFb77PmI1PTrsmHkTKrynvV472GOVmb/jlAt1nY
	zibVb2U8BpjWbOqBfIVdebr534H1KpCUwszG
X-Google-Smtp-Source: 
 AA6agR62uG8kaGpmDjxPBgLM7PJcImNlgQADrKwQJWpqnsReybYgQKmV7D3nMFdVyQhSju/QkEWW5w==
X-Received: by 2002:a05:622a:13d2:b0:343:3f3:4c3b with SMTP id
 p18-20020a05622a13d200b0034303f34c3bmr12327986qtk.246.1660527313078;
        Sun, 14 Aug 2022 18:35:13 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 t24-20020a37ea18000000b006b9a8fc0c93sm7598402qkj.53.2022.08.14.18.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 18:35:12 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jerome Forissier <jerome.forissier@linaro.org>
Subject: Re: [PATCH] optee: use CFLAGS{32,64} to pass --sysroot
Date: Sun, 14 Aug 2022 21:34:38 -0400
Message-Id: <166052727877.2952670.11354272761077623071.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809154244.2040759-1-jerome.forissier@linaro.org>
References: <20220809154244.2040759-1-jerome.forissier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 01:35:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3680

On Tue, 9 Aug 2022 17:42:44 +0200, Jerome Forissier wrote:
> Since upstream OP-TEE 3.16.0, CFLAGS32 and CFLAGS64 can be used to set
> the sysroot option that previously required the LIBGCC_LOCATE_CFLAGS
> patches.

Applied, thanks!

[1/1] optee: use CFLAGS{32,64} to pass --sysroot
      commit: f2781a9c8df0e9b09c6cac498e506ce2f882c2d6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

