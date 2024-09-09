Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310C7ECE57A
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 13:41:34 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.53242.1725889284983284540
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Sep 2024 06:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=VJeDOVTZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-458320b30e7so4104861cf.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Sep 2024 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725889284; x=1726494084; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2EfIPGqN+T/ehBtSz5F5TsX0WZqY5gTiPxx0Fq3EDg=;
        b=VJeDOVTZWRS6PWmiR0LswKfvNKAnt3g5KRnPXBidle6H+d4yWiw8NKfw5P1UOlPxA5
         dkKj0jOd5QJ0wmXfC0FB/DuEFDgtVTXF9RsgQErMArWL1r7YcggPatEBqr2f5BDo917r
         KUK6oYtinfcVQgCqyKMD5fwAtVPahVjj5Gfxa3rtIu5YC7brbNLR3B/dSztvjuF0vAie
         3Slqi9aOVhmBeqaI7+g4n8TGThUpwWp0nNX1nBXLc8Fpxq54Hj0XXxvuOe/NZKcS9C7q
         0iWYqA10M9ydDSvkWVuyy8P9cNb1RUGYGW2yWBQrMZIrnEsd/UY1F4oaZaaYw/Jg8GLw
         XUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889284; x=1726494084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2EfIPGqN+T/ehBtSz5F5TsX0WZqY5gTiPxx0Fq3EDg=;
        b=t5t1QeofzzBf6TUQvl9tYf4GLn3VMZOFD7ZTgS2ks9owJxGx5JICnVmBd/pXTFqMlJ
         CAaH1fRW6TRM6fCRzyESSVzM7+g1+ztuvEZamhbdsZHWIKNlFQTXdkDrQ4xKE8WndHxE
         7nOpDV2tLZWEc1AYOYMGNA8hc3MoOxxMyeBYoFw9/9lPfCHcnohfKZDonJydB29ich4q
         e9XP1cGr5NRYXTQQOkGsCbiQn/x9FfPkd/L6jmh8kTfLimuyvgHNxjiQwfenbTB6fHRU
         zugLM8F3BWHJEJFY3PUgjzbgaRPGHtxxpajhOTW3POgkAvrZJ7WY+QA0F3qtv9JZaMWv
         eyWg==
X-Gm-Message-State: AOJu0Ywn+OupRF4YxCJp2n9VTuD3BWQ0V835i3wGypMPJ6ZjdcQZPLRk
	6xiKb9pw+XaUP2V4tnFh+IAKEYRXpFjLHVWhe96f5kI01htnoTmUAS7ssID3AxjSPbN5iDbQD+I
	=
X-Google-Smtp-Source: AGHT+IFyeur1sNNtFIeRImO8EayPfu8poGAVPGnZiRoiqsTo6AfA3X9AT5zSMX13oW6ZQJzz2ZGMQQ==
X-Received: by 2002:a05:6214:4306:b0:6c3:5946:ea0b with SMTP id 6a1803df08f44-6c5323e28a9mr91271826d6.11.1725889283723;
        Mon, 09 Sep 2024 06:41:23 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5343491ccsm20899196d6.70.2024.09.09.06.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:41:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] layer.conf: Update to styhead release name series
Date: Mon,  9 Sep 2024 09:41:10 -0400
Message-Id: <172588927045.3341816.18030538955578897862.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906165809.3715892-1-martin.jansa@gmail.com>
References: <20240906165809.3715892-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Sep 2024 13:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6069


On Fri, 06 Sep 2024 18:58:09 +0200, Martin Jansa wrote:
> oe-core switched to styhead only in:
> https://git.openembedded.org/openembedded-core/commit/?h=styhead&id=b4cf6d5236a3eacaf56ca2f805b006efac65b26c
> 
> 

Applied, thanks!

[1/1] layer.conf: Update to styhead release name series
      commit: f3d1c0293e5940ae763049c45b7fa4a3c59f54ad

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

