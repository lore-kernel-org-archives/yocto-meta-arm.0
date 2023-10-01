Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F3FE7848B
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 20:17:36 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.67552.1696191455442607900
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 01 Oct 2023 13:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lnWzdnmO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4196c617ef0so24885361cf.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1696191454; x=1696796254; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkkJuWVoGkIVVUtm/jhjG2NqCd3XRvhWW/ZcNAk3Iys=;
        b=lnWzdnmO1LzEDAyUMHB0EF3G9m7JXtRZ0dLyue3cOOqNlwkwhOVCHGv9k9N4JdmRxp
         AdUzynafo69nXBywVHFAzmKsW0q+Y9/HT9yRMzFl94k+UVYEaA0PkK5KZiXGi1nLQ5jn
         uRPbM5Ad05KLjwlz1Har4EgrHjtAB6u3m6pFODdB19z8m3E0YwA2tqymnbn1eRPHMoet
         jHyRQ00ANMU83j+SsGCoYNWR0JUCNJ+gjxerEooq9bhQeLz57SzfSWIRVMsDnVa08rqs
         +ipAFOi3so15ParvVPvTQc5v/2wnL5e9BgebEo0mRBBnkkrarX7hUnElOJu2WDfDGTcf
         Yo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696191454; x=1696796254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkkJuWVoGkIVVUtm/jhjG2NqCd3XRvhWW/ZcNAk3Iys=;
        b=VBbwjAFXpT6MwneWqWSX9Iki+NETeM3/zU6fk1kffm9ohW1tJSvdPHxW2XRdNckDdf
         rBZk8R3YfRaOefQKinJlchIoNYvDJ5OCF29QOhYJp59kxP1Nk4vlAofS2fe0Mb8Wlgm0
         U3osPQgnyNSuboymsjFj+cElmC6N7Low6Z0kKRDmSSRQD5gtHOVEHMtL9N57nw/H3ewi
         vM2E5OhJ8b4yJJjpG5gbCsPcIIWmWbiEWh2JHvUVeC2sfzzmWkET4Ongp4hqNhIumTKI
         D8hcVsqj2j91W/X5OOiw+SWVxaC4rjmn1jZLYAdUUc7vGsFT9HkuFif9Z+SdTHVFKlQu
         VgMQ==
X-Gm-Message-State: AOJu0YzYOQmfwZG81CNMXmHwO4nl0VEDJum3RUuYrUenklbpNTOIKney
	7ePDjH7nj7qRaOlBzbHpu74EX7EDTLsWGBHtFIk=
X-Google-Smtp-Source: AGHT+IEidjRpQ7vynRgsLQm+zfFm7daYPXHzU1dKCpXxAsa6bgeoXRI6BW6cD3gqBj5li5ZMT3nEOg==
X-Received: by 2002:a05:622a:d6:b0:418:178d:a10f with SMTP id p22-20020a05622a00d600b00418178da10fmr13097020qtw.29.1696191453999;
        Sun, 01 Oct 2023 13:17:33 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bw14-20020a05622a098e00b004196a813639sm2727714qtb.17.2023.10.01.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 13:17:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH mickledore] arm-bsp/trusted-firmware-a: corstone1000: enable ERRATA_A35_855472
Date: Sun,  1 Oct 2023 16:15:18 -0400
Message-Id: <169619132219.3169419.13772473591917756970.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230928142817.391920-1-abdellatif.elkhlifi@arm.com>
References: <20230928142817.391920-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 20:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5092


On Thu, 28 Sep 2023 15:28:17 +0100, abdellatif.elkhlifi@arm.com wrote:
> enable errata 855472 for Cortex-A35 in Corstone-1000
> 
> 

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: corstone1000: enable ERRATA_A35_855472
      commit: 59224ced53ad1295321b5ab323c0944330007979

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

