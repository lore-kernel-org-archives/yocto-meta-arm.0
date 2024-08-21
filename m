Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E110C5320E
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 03:45:31 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.12251.1724211928336485742
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Aug 2024 20:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=OP0oEC4v;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-45006bcb482so31987591cf.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Aug 2024 20:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1724211927; x=1724816727; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtalkyU5AzK2XV0KrVZHLW0IjWg0nsXoNaxvA4/q5C0=;
        b=OP0oEC4v2IGSGtXrIrxQlwq2DoxhduebojRB4xfYCSxpr7xBiNPo50DXHGVsxlJ6ZS
         N2AO3iJ4N/MXjvgunGWp2mu0i8Eu+bNQm5wKTJvhI3PlPsTouLTI1HxihMq+mR/WRafo
         gKnB8f1jMEUevri2m1vQrNobQqwtq6/PvC3oTYdNcFqzEYnI9Mxhe/zC3OkCsDCq3/yv
         +dzQP33u3n/U1fINbcZdXml7Qzmmvw6daTdGafz6Hvah5eMX3uKNJDQGsFxCKoX3nwJd
         kmWa4xy9szEPff11hTw2CjOtPVH0iqKIDTbYeanSZByeM956u9+3SJuA9i0k95ciECRW
         o1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724211927; x=1724816727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtalkyU5AzK2XV0KrVZHLW0IjWg0nsXoNaxvA4/q5C0=;
        b=QIrFEG9iSQa7IS4VvCocdUZKysp3FKvY/4VKj2ynTUjUKPvEumoycyTruhQ/39uyGL
         88PT+HScQ+kSRNKNAEUwFEncYwgbAiPngMoPi3VcUkzOTSd9FD1tinZf4l0d62tIhh4u
         ExEywAy+p/et0MCdoWuWcmyjilOWZiL6o2HP6/vgO1zTteIsQVneCIVNN9RfmFxBbM90
         vKvDx6O5/2jsNVT+g7vD5YZDtxxdtXxlMMoP1VOGi4VC6pPlENlEDkEyvAKslLI9JUql
         M4YTfpTpHwmftaj1RY90OWDLmW0399+eiVCgWLgVeyLUXy6xx3qBhoodglh1/Jhp4KM1
         YiRw==
X-Gm-Message-State: AOJu0Yx+LICSOMdYw8dh4T26IgBn0+xIDutC7Q1wgkTY0aI+ttPxFDJU
	3nIKgCj4mZLrb7IagYn3Hbm9WfcIl7b+mktwxR40TF5hsENfxuuSQCvOD+YiomnGlERf07tXufs
	=
X-Google-Smtp-Source: AGHT+IHzR/+9Q2rjCk9fWRGUVUwqmkJLitHIGKF48ta0TSC7ul9kqCEkbJ0WGs3x+2VI+S5uPx7niA==
X-Received: by 2002:a05:622a:6207:b0:454:b6d3:eb61 with SMTP id d75a77b69052e-454f20e1b48mr10051061cf.0.1724211926977;
        Tue, 20 Aug 2024 20:45:26 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4536a007515sm55742171cf.48.2024.08.20.20.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 20:45:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/qemu-efi-disk: add rootwait to bootargs
Date: Tue, 20 Aug 2024 23:45:16 -0400
Message-Id: <172421191600.3475173.4569111387916808550.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820134317.3438-1-jon.mason@arm.com>
References: <20240820134317.3438-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 03:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5983


On Tue, 20 Aug 2024 09:43:16 -0400, Jon Mason wrote:
> Adding "rootwait" to bootargs for uniformity with the other wic files,
> and this _could_ resolve Yocto Bugzilla Bug 15562 (as the intermittent
> inability to find the root disk could be because of a race between
> needing the disk and it not being mounted yet).
> 
> 

Applied, thanks!

[1/2] arm/qemu-efi-disk: add rootwait to bootargs
      commit: 05c0b9bd1f9b67fee8a18505c841285a9f0c302a
[2/2] arm/arm-tstee: pin kernel to 6.6 to workaround issue
      commit: dd0f6111b43de42084eeffc74b479201f6e24647

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

