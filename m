Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6DEE7848A
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 20:17:27 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.67328.1696191440613632552
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 01 Oct 2023 13:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PK54yqqU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4194c3cf04aso62221611cf.3
        for <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 13:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1696191439; x=1696796239; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zW/2PlxaLa37WhT9ndzs8eVcvpL34AvXLdcgv/uJqs=;
        b=PK54yqqUPAtKyr8T3E/MZDcAKbxYdDybYEUxKIJeZP2ZfjGP0AGVTR8qret/nWlwb/
         JFDcSN5gxGXsJNkw18ED4U85CfhgbiVWuBbRiw6kRlVrXjPRzqzmyjt7IGTstiP5ekR6
         9gLhGARb67q3rMgUfhNc3ISshw7FiPm5cHiC4nC1ubQyYSJwCb4dB6YR+fK2m3lmVEP4
         NcdjT5aCEUMK1eEogRgpsV0v2fwOsuLSpK542UtULO0FOwQNaUmDrBYclEqEUWRpv70B
         7la+9A4h58KxBEMKS5sT6hMWONqTHIlAG78VKSOuyyGXOIeHsCitSRD1obJ0ecV8SNXP
         JCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696191439; x=1696796239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zW/2PlxaLa37WhT9ndzs8eVcvpL34AvXLdcgv/uJqs=;
        b=T/isgmafDGKR3hxlU5rI3bKc9gxjaWukANefMqq6x+Te4oZOBuVNMF1AlVABEK5HR6
         kEI5J1bPpring28H8BFTBF6/FGcnSUr+Ul5R4M7+U6z3jhymQskGgT1le6V/zhnl0dmn
         LNYV+ZV1zbko/OsHI/CP+WuGhtZE5e3c0m7srHgQxFXVU0ALQFV5WyylMgMb4tQn4DkN
         arxS945KyrK8aTyiKLm/sr35oJ9IyYVemB/GLSVM3dNTzYrNvJD+JAUqKAkXn8r4703R
         B95BdAeF3vt4s1Pcvv1ov6o23utYUHsRcT6UVqh72G1cX+GqHh7p89P26x9hfbrhHBDC
         jfPw==
X-Gm-Message-State: AOJu0YyXznliUSLYB8d4aniL9fGdH1+v8UpveGS260m7lvJ832ubpAh5
	2XCYm6Bi2PtLtC5/TLk2I37BlG66zdSAJjaIrbo=
X-Google-Smtp-Source: AGHT+IEcm1dC308xSms1l1C3fbofHT2jp604qYMOAzPFCyNqSqVXKyWMIvQSFf9A+5fzd8OGfyBspw==
X-Received: by 2002:a05:622a:308:b0:419:51be:6b5f with SMTP id q8-20020a05622a030800b0041951be6b5fmr11552837qtw.42.1696191438984;
        Sun, 01 Oct 2023 13:17:18 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z5-20020ac86b85000000b004182037f655sm4664883qts.14.2023.10.01.13.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 13:17:18 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Corstone-1000: U-Boot DT, TF-A errata
Date: Sun,  1 Oct 2023 16:15:17 -0400
Message-Id: <169619132217.3169419.15380593622813686865.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230928142533.391672-1-abdellatif.elkhlifi@arm.com>
References: <20230928142533.391672-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 20:17:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5091


On Thu, 28 Sep 2023 15:25:31 +0100, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> - Enable 855472 errata in TF-A
> - At U-Boot level, drop DT nodes that shouldn't be passed to Linux (needed by SystemReady IR 2.0)
> 
> Cheers,
> Abdellatif
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-a: corstone1000: enable ERRATA_A35_855472
      commit: 59224ced53ad1295321b5ab323c0944330007979
[2/2] arm-bsp/u-boot: corstone1000: purge U-Boot specific DT nodes before Linux
      commit: 668ac8338e19c2fc63ece01be4c4107d06df051e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

