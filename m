Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB724CE8368
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:25:02 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.59483.1727713498516015847
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 09:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ODr9iTFj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.177, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e25d380b464so3872981276.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 09:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727713497; x=1728318297; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x34xEs10GJeUF5wRPB3j9z6B1ElZjhMCdpD+ITxx5pY=;
        b=ODr9iTFjtmJGA5924fqbY7zvd547X3x36I/avblvedF6JzpS3cKwEJKAoOD8wXoXJv
         /hVE5xMEdgMrFb0BFlr0UJfHdjVhOTM0B++OigRGmIK0PGiojPJuohLbraZ4lQastA+7
         Gmh05ODPHadCr0P95KJJCEkW21mvgPi+ZSh4yYK4Cv44ACwXa+AS9/JaIsAtB4Ru1drs
         OWFixFrHQ8pDjY0w0eBQQlusMiUoG0I5PvAROwos6hg5iRq6k4vW+wfMKfVsd9zIaynD
         XZ7DKc3pGtOcvkA+Rc4PpE4eGB0bRcxKU3LcdCKXvvi9KZwYGM9K1EttXduaycMgEvc1
         yi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713497; x=1728318297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x34xEs10GJeUF5wRPB3j9z6B1ElZjhMCdpD+ITxx5pY=;
        b=SpxdWvKXxktjdesKTgeIALBCxiFYQF/1rOWZ31isnttNCr4mUV7yNH07+e01Te8Y7f
         hpZBLp+as1IggqrLjiT3Isyy4QAWikyT4KT8/TB3qvaRSKmLdZHWViZN3b28w1Kq1efw
         NlNAQ1SBpJzpAUrqZVC2fL1mXaD/+vA3MekyCBh+g3JzMj26q3YE+2SG9GgBcxkYtpOt
         9LXvx7lEaH9nelsJBmuFvPGyI9ulqZ5CIAOkp6mEn/EX01/itvhRY22P+XW42YAs3tNl
         /XgayzAluReG65H0sSYYkan6ekvBZrIX89FlGD+VCK2EGajo2zA67k4hAk8N4xr9Y4e2
         MXvw==
X-Gm-Message-State: AOJu0YzZp4rWPb9PyYXsGstrK/mYqqukujcBy6pCYdCXzQlTDVO9iB3E
	+Ij3KxbR/ixTM7rU5draxrYt4R287ePOOn9KNMuWEL0norbuKzwVC3ItfBBTnYSocuklWZPfkYQ
	=
X-Google-Smtp-Source: AGHT+IGKsudMPHxTpJAbhn6JmXKrEqPOEzHV0afmJ/EQwAtd4CNaehtVrXkqcdx8Yysi/gLNH+ugoQ==
X-Received: by 2002:a05:6902:100b:b0:e25:ce5f:42cc with SMTP id 3f1490d57ef6-e2604b51542mr10948580276.32.1727713497473;
        Mon, 30 Sep 2024 09:24:57 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e400f08csm2435737276.22.2024.09.30.09.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:24:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] arm/trusted-firmware-a: add recipe for more-recent-but-not-yet-released source code
Date: Mon, 30 Sep 2024 12:24:33 -0400
Message-Id: <172771348141.724488.18364967480244160640.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240927-tf-a-master-v1-1-733c925c80e4@cherry.de>
References: <20240927-tf-a-master-v1-1-733c925c80e4@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6143


On Fri, 27 Sep 2024 13:33:48 +0200, Quentin Schulz wrote:
> The point of this recipe is to allow people to quickly test more recent
> commits that aren't yet part of any release just yet.
> 
> One should really not use it in any product, but it's nice for CI and
> development purposes.
> 
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-firmware-a: add recipe for more-recent-but-not-yet-released source code
      commit: 7eac705805c883dc8960589880f429efd5f40fc3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

