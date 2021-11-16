Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E18C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 19:29:11 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.916.1637090950490492663
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 11:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=6b9qqF9Z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id s9so254455qvk.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 11:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CVCherd88gJD2Taq7Fp98F4HFyL7AE+HkmlEZuXYH6s=;
        b=6b9qqF9ZcVep0A29nlXt9xO+lYEoAOoRkltnj7FrodJ5ItiVNYAyf3cRz0Rap9vwq0
         0Da9OPSBsygekMWpD8xidayfpugXOtRS0zUt+HfpCr0hniCuHg+MRSX7/4IOOPNghHDl
         HbFrmapT02EjnB2p2INAJcIKLGXzAMyJBlAWo3kQ4i5nNUQYWhfeV5S1gEltkiMx54r4
         kqraDK1/CYsgjj21AC/HQVd/aghXtXVESqFnDi4+5AAcxUf6JX/LzEj/zau4aDZvHZLN
         o+o7z2KJI/KkSl8Dbb0Wg/jdJhSuzEbzr4DoOMNBLMM5TWTL1juR3LVV7yG3HYY01Hf+
         An1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CVCherd88gJD2Taq7Fp98F4HFyL7AE+HkmlEZuXYH6s=;
        b=OKtEqhGMkpMWNrjDB9uJabrSxonz7aKglHgUjjXFDM5lNfA34Vatu4cI/ATwsvlsKI
         Y2DoG7uEGehI4t+6kMB/djNCjiSDT4H6El7iMSAbyBWOSihvHUVWycW7Wle7mKxBygxd
         BQYSjkryZzj/loqJ0GZqzZNrKXN4efEZmHobd+v6d8lugDt0D1srjTXuOf6O6cFrVbF/
         L2fMpC+H5awiN2s0QJ3k13PfCnT2cCYQbAzVHz9zNby1S656xfcbBjSl15hDchzjHJjD
         nXUsLYxp97OLIizrATduuRi8pd7zJbfELp5uoUrwJJA2eiAINrAiZrxzhWrmRXhnv5Wd
         aBaw==
X-Gm-Message-State: AOAM530IRHY1tBfpCJG2jOV4hDznfVoYqd6E7bS81kMQ3BdQ4HSa7z9E
	bCbcdCVtng+xR9DwolnA+hOUGOxliR2bAQ==
X-Google-Smtp-Source: 
 ABdhPJxRnKZ/xO/dPoL8YkZH5pCBZu/aJTS4fAtbwitqWNJDO9LJfTHayFJ4x14ieGViK5fniXOr3g==
X-Received: by 2002:ad4:5aa4:: with SMTP id u4mr49032458qvg.7.1637090949432;
        Tue, 16 Nov 2021 11:29:09 -0800 (PST)
Received: from localhost ([2605:a601:a618:1500:14a6:8af6:f343:cbcd])
        by smtp.gmail.com with ESMTPSA id
 e20sm7371085qty.14.2021.11.16.11.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 11:29:09 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] gem5/gem5: specify precise BSD license flavour
Date: Tue, 16 Nov 2021 14:29:05 -0500
Message-Id: <163709087726.8419.4734069886831153323.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211116145639.3483446-1-ross.burton@arm.com>
References: <20211116145639.3483446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 19:29:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2412

On Tue, 16 Nov 2021 14:56:38 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/2] gem5/gem5: specify precise BSD license flavour
      commit: 5cf722a3122fa60385f0a99876ea57d31cdf88f6
[2/2] arm/boot-wrapper-aarch64: specify precise BSD license flavour
      commit: 1229061f8b323d63547907e63aefc5c494444971

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

