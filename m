Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BE5C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 17:50:37 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.15820.1642701036733728357
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 09:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=KFqGjPUO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id c19so6880716qtx.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 09:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hqfK0fxmf3POdFDbQCV+I7XajJbFyFKQvUIQyZ8z2cE=;
        b=KFqGjPUOUO+8qY4q0KKuS1++2zmeEsCCpr7i8vl06xeGUL/PmvC1z4uSwHjYLFzVnD
         1M/htp/EAxVthcIkTrr8ajXR0dHE1pa8KxFXoXc+M75lT1by+1K7Jt9YcCDpMVbQ5fbz
         uzm63DtZ5+SkS/1MCOaBVnr+GYGj0xdoVuvJun0tOghI1NcBvyexBI/BVCbEPWMTJw8R
         GTCOn8ZibAbgT8qW+jxcwshKgBs5WVgT/Cvoy4Fq4r9LtAphvKcfxNr85+Hrm2UEeCyz
         yEKEHCEWcKBKqpYkXD8Dlrzdh0snLLH/6/caFI7aCiEf+dMjjqR6wIyOgFwspETLOYXz
         nM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqfK0fxmf3POdFDbQCV+I7XajJbFyFKQvUIQyZ8z2cE=;
        b=Zn9F9LmZEb9kle+guK9OK6S1lKT+H6zvsqvkhdxuDFX7MF07VxY7ojPZFaRa82wrcH
         bMMlH6A3W/x07NTyjF8mQBvvgnnKGCV7tuSatadab1alTJW83dBGjJVr5DoEAxa0qPvc
         lyly5B1TfhFQBSAGsD0LCoCHa+P4e7/aYjDa+W/HSZcS+Gdj2FcGWYWw5tT2V5MWbJd5
         JbMgs2XnyQVCnGHNHBthG2sveX9vi+Vp6XXDYGsddAK6GvyUrhzPH4fWqHduFT3c9456
         HHO/DuO4QEiziN9d3EGPmrz27X6UOlF97jc+qVVyL1wXq+fyaMqKHhiAb/Cnell1VmNQ
         qi1g==
X-Gm-Message-State: AOAM530dJs0pSVqfAt/fWnZju3p/gU7dRd+Ele/DtsfOO2epyBF7HGWm
	V7/Oud3d4Ecl+GpbNbKyED/S4npwTxm+fw==
X-Google-Smtp-Source: 
 ABdhPJywyX1yhcuCwagFprT223ns8qqRmfSHeYzfkiFOqea56H6iIu5+sgeuO8GWuKWyfXXj+MKUYg==
X-Received: by 2002:a05:622a:1010:: with SMTP id
 d16mr37070qte.555.1642701035457;
        Thu, 20 Jan 2022 09:50:35 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:86a0:fa:bb0f:c64d])
        by smtp.gmail.com with ESMTPSA id
 x16sm1881671qko.17.2022.01.20.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 09:50:35 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] meta-arm: add old version of python3-cryptography
Date: Thu, 20 Jan 2022 12:50:25 -0500
Message-Id: <164270102559.202212.2969158871547679422.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120163206.1950366-1-ross.burton@arm.com>
References: <20220120163206.1950366-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 17:50:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2883

On Thu, 20 Jan 2022 16:32:05 +0000, Ross Burton wrote:
> meta-python has upgraded to python3-cryptography 36, which has a problem
> when used in native recipes:
> 
>   cryptography.exceptions.InternalError: Unknown OpenSSL error
> 
> This causes all builds of TF-M to fail.
> 
> [...]

Applied, thanks!

[1/2] meta-arm: add old version of python3-cryptography
      commit: a15c16068ab011e2ba91a6c4ca6e1251de0d8058
[2/2] meta-arm-bsp: use old python3-crytography on platforms using TF-M
      commit: 2a27bd4f47d09bb709a953f4a91ef2a2cf921255

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

