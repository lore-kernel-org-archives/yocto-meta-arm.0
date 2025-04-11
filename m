Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307C4C369B1
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 19:13:43 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.34755.1744398820001516485
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 12:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=V0tXyWBB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47698757053so26489421cf.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1744398819; x=1745003619; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cBLAb5AQC1KpavAxMv73hwKhEl6e/5cn9lq+hCt9lY=;
        b=V0tXyWBB38KVpG4p8T3/hN/tRYuHGvJBgcntspEGF41rpke6OZaKPa4zvstOcSWmSL
         EPG93xE1r13gki0xZ+Mix8Inh8wqel4xd52pl6YSzmzDMzmtJLQjaEchLDt9YLUrE8qt
         4cMetAOjXP7QaxG1f5TewoSuMWhwWMAz1ZmR/47r6Bi9VAoWUl9mQY0yMVEjzd56TILB
         OWVNm4uYxNRJB6nxU1W7ItAFCHdLz6m+TVqX7BELJtYftJF4asnQ+y2C+YueINpgczHq
         TrxXkGkxvN/X3T5IxlDk5MzffLuiLvuftmde7nat9NEVHKJRGgdmU972PxVBr4kJt09o
         bLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744398819; x=1745003619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cBLAb5AQC1KpavAxMv73hwKhEl6e/5cn9lq+hCt9lY=;
        b=QjB9WY4Dag0mBEjxX5MpsNgZtPxKbwLiTXCJP5HHuXaiYhRjYYSrkNHMdDCjyPurnu
         e/Nf4O/yssLYwPTXfYDrPffAUKSoMCdry6oXF+jsn70EcVVwBFmmz9/5wfNCxFamCD5p
         IIQVKOg1/lWeLAzHeYHKtxkeEcmhi1NI1QQ91FYeCn8poUAY1AUfzb2DTV7YtRH4S3Pi
         QXaHQeMsY8SGOMwt6w2IrrEI/Obl3vBhGQBzR3mSgkUcvkLz/wDBBad9c/NViuPir7s6
         sgIVQbO50DyaI138eYWjVzxbiPOIM/Hb/9grDeCC+nrRAOpRXGVhLjB8OwqmMKVsbN4J
         1jZQ==
X-Gm-Message-State: AOJu0YyW8s4cfKWPAgWLPbD/K8CpUH6Aye+MjHUtI0tortcoDlsDTH0m
	LHogUvi3Edafxlnrpvvrzwrc59H1622qiJdyRqUIqKFj6dbyHgMDeMzW3n26gAZZeEgKi99uW1R
	V/A==
X-Gm-Gg: ASbGnctjCeCuhV4rEzm3SekBXx9iDvaUZa1F0D5D5UvHXgz6J0L0CW0faU2EFEm7I4g
	7jrIWuEVYciBlHuAc/t9iWpM8SVZCVh7z73QSBXwLZ7EhVT9Dc5zJnH5vs1ugmO/NO9Iwla+gsq
	KMEcw/GUBPdi8xsvNhvq0s7IdfkiM8/8DTcTrXvL4KtEaN2ZQoCJ1AVMw7QyRYAMJ8HMRmT3/B4
	YQp5ER08KftmtcFShy+nRtQWlIqT/sCCORD9IuMeAhBi46oj/tCXS1wk01Q+mwYxBhqnwVFNUZI
	p5KNp73Ix14aLz4XI43KaIW5S6KLiOeX
X-Google-Smtp-Source: AGHT+IExMVty8Ez4HIhPNFHhB7jSR+OgSJTICKZ0NiNtxA3Nc7ZQnC8cJrqPPSGW5X2vxfvj0ndf0g==
X-Received: by 2002:a05:622a:1a9c:b0:476:8f9e:44af with SMTP id d75a77b69052e-4797756623dmr46441791cf.29.1744398818614;
        Fri, 11 Apr 2025 12:13:38 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796ed9bd77sm29583401cf.51.2025.04.11.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:13:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Gergely Kovacs <gergely.kovacs2@arm.com>
Cc: Gergely Kovacs <Gergely.Kovacs2@arm.com>
Subject: Re: [PATCH 1/1] arm/trusted-firmware-a: remove optee-os dependency from tests
Date: Fri, 11 Apr 2025 15:13:30 -0400
Message-Id: <174439881346.2238189.5788886579249863813.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408085937.2068053-1-gergely.kovacs2@arm.com>
References: <20250408085937.2068053-1-gergely.kovacs2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 19:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6460


On Tue, 08 Apr 2025 08:59:37 +0000, Gergely Kovacs wrote:
> The TF-A tests should not depend on OPTEE-OS
> 
> 

Applied, thanks!

[1/1] arm/trusted-firmware-a: remove optee-os dependency from tests
      commit: 79eb13dd05104cfebf3cf0d33ac0fb7bb3d9b239

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

