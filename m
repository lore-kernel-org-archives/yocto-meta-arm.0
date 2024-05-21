Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B87C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:20:35 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.20875.1716301225947535533
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 May 2024 07:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=iWb7UdUZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.53, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6f12ed79fdfso1778527a34.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1716301225; x=1716906025; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR1vF1ynXuw4QkuuiuXPnAA0Ewz3O87PRVtEf69DiFg=;
        b=iWb7UdUZ8fmIAxEaqpsRm6ZmZKpP32uiHJ0Qk/CyWnmsxIz1G95Eiaye7Ox1BCBtdw
         +GsSbXIoRirKZGAMkCenJtliZFLg4F0raWBljb45m6dW9WtiQ0F53QynO0JF2KIQ+8ge
         +WSjlOgRzdgbtap9jc388nPgFsDa3tC2gHimFvAzFvr8xn21+/KQ3mmYjTT66DJmwesj
         J8jmQ61Ber7W8pjq2J1NY/cXap8eD40nIGOdE812HFNsQpkJc9szsKPICITSMpeERYoU
         PjNpj3xKicotBgQOK/f6+ZwC0N3VpPEiohJoUKMssmyUvAQXwdys+7VXJtgJtcIz4yv8
         j9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301225; x=1716906025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OR1vF1ynXuw4QkuuiuXPnAA0Ewz3O87PRVtEf69DiFg=;
        b=TZp4KgczJkjmISKswnzoDzBenQH1rtEnvPihBo1ulV9+Ih0GkdFpUWrW4han6dMlxo
         6h8xFCWeQ8LvtO+0qpSRWLqUVMXDSw9EHwxP/2Iu1NvmUokyGAaySPZrYN9pxqn4Odp0
         8cZ/+bbGcv9DK440ekgP39XIPDxrgRiFWqQUUW9LEcL6psAdVZUIO5EwWZenY06DJDKx
         HbAsI0FUfgNZxJxiwtOSPPp54K8AlCTJ/dpCg2w1Oc4H/HyLNuDEOJYf+qTIKELmh/s1
         vKAFMxHhym+kpM63tpqiVKEwW1Ek+igvkKZylHX42AR060pYFAmErV2gklDuHp6hR53r
         Jk5g==
X-Gm-Message-State: AOJu0Yw6o4Wn5pKLY5QzLXYpgzwc78i/0OnRMdFRhHK/3Sqs1NMei0iN
	joGeqmbz/X9JE82i2v0zooEyOZymDsQHxican6RPG+KGyx/k03xKpMM7xJi12Y4QFC+OzzgTKvQ
	=
X-Google-Smtp-Source: AGHT+IGTzd8+SjHT3yuw5Z0e0TDoN5wTFY2GU9rcyz5MHDGLSs4UVXAFlZlQ7fjqvnomEi6w91rwQA==
X-Received: by 2002:a05:6830:1e16:b0:6f1:2b6c:a468 with SMTP id 46e09a7af769-6f12b6ca632mr14163095a34.0.1716301225063;
        Tue, 21 May 2024 07:20:25 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f20570bsm122158476d6.140.2024.05.21.07.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:20:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ben.cownley@arm.com
Cc: Emekcan Aras <emekcan.aras@arm.com>
Subject: Re: [PATCH 1/2] arm-systemready/linux-distros: Upgrade the openSUSE version to 15.5
Date: Tue, 21 May 2024 10:19:46 -0400
Message-Id: <171630119043.2318166.14193665635176129774.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240510142456.54323-1-ben.cownley@arm.com>
References: <20240510142456.54323-1-ben.cownley@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 14:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5740


On Fri, 10 May 2024 15:24:55 +0100, ben.cownley@arm.com wrote:
> Upgrade the openSUSE distribution from version 15.4 to version 15.5
> as well as the Licenses that now include Apache-1.1, BSL-1.0, IPL-1.0, Sleepycat, and Zlib
> 
> 

Applied, thanks!

[1/2] arm-systemready/linux-distros: Upgrade the openSUSE version to 15.5
      commit: 8097a792db82326d44b71c019ce94c00ca6f7e01
[2/2] arm-systemready/linux-distros: Upgrade the openSUSE version to 15.5
      commit: 8097a792db82326d44b71c019ce94c00ca6f7e01

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

