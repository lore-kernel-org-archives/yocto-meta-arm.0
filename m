Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E1ECD3446
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 15:32:51 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.26451.1725377570924022977
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 08:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=YmfvHxCO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7a95efbaf49so198410885a.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725377570; x=1725982370; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnOPKtnPga4stTJsWMUwBVkz7f7dzZlqBbyexIbCok8=;
        b=YmfvHxCOihbEVniYjiSldUH0OhwfZ13ZP339xc0VhyKKDajeNpQp0Yo1WDeZ5T/jod
         9ytkJIZau2Fy1UTWjbFLPLgb4QCe4ZLFxk43I4zTQrUOEEgegosMVfJE4WlvAEcpgv+k
         icsjIgAe45jazkhdZdyF3A60FfDuIz6zd0GPvGYg4PFPSjGeG1c7kYBP0xe3N4T13xGM
         JTNHKZBWrmv7bbtUycrjNMSjZKc9GEbrLAPF0NSaOKhFkH+aRsPt+82tNsE802PbDSEb
         kY/xqaSgGNf38othw/lAcG+qwzeRieiJk0dt4JgtQOBnu5N4Ih9Fo4YrRBYQ89G9CII4
         Sfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725377570; x=1725982370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnOPKtnPga4stTJsWMUwBVkz7f7dzZlqBbyexIbCok8=;
        b=d3RSCVPASLrJJ0QOJ9oJttvnCDFLTdww369BMgC1jEN496Lwl4j7tq+ydGp4rW/dHU
         zrIz5TmDgJmVWns+81ClfEMBfkuG1HO74KBo85sL4z2gSAlASW0EEdI92xH+6ibkXv15
         Jc4DjAm9qy35ZUb5OhUBSnIPSqJJoaeZ2ID05ekxDW7hIQydDFTezFd5QQXoViJ7wAUt
         rzPGU+9naA6/M0RMNuhZdM2088LFCph2J+qHZ0JndLRkuSSKty1mbSN/F3F028bYZD6l
         Mqi2X0XZclMq95c96yfgdU+LBNlrw2SJp1CojV4I8ZwVP0RIUaFWPk0cp5Q6+Xe/vHzO
         yafw==
X-Gm-Message-State: AOJu0YxRJuPBGP5zUVGxtfaPpPymwx+ho7zSUkuIEj2xhuouN7uWH+0M
	vLpCabpzMglnSrKPqpL44Eg+k35fVR1/+I9vbxIx4nGV1dGY4Q9PwBT9boLvwzTcbrSobm4fF+I
	=
X-Google-Smtp-Source: AGHT+IGqJpQ1a2uMYHjIztaBKf/HDgct8ovd8lToPYmwgCm0sQMVq/K4/PI05s0X4wEZFpLTYrXdrw==
X-Received: by 2002:a05:620a:4481:b0:79d:5b21:804a with SMTP id af79cd13be357-7a9787ea737mr425214185a.14.1725377569581;
        Tue, 03 Sep 2024 08:32:49 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d83d2csm535205785a.127.2024.09.03.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:32:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/trusted-firmware-a: update LICENSE entry
Date: Tue,  3 Sep 2024 11:32:24 -0400
Message-Id: <172537754408.2698594.13880875482245806485.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830155148.24392-1-jon.mason@arm.com>
References: <20240830155148.24392-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 15:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6055


On Fri, 30 Aug 2024 11:51:48 -0400, Jon Mason wrote:
> As pointed out by Denys Dmytriyenko, the LICENSE entry in
> trusted-firmware-a is not accurate.  docs/license.rst specifies the
> licenses to be BSD 3 Clause for the project, with code from other
> projects imported as:
> libc BSD-3-Clause
> libfdt BSD-2-Clause
> LLVM BSD-3-Clause
> zlib BSD-3-Clause
> STMicroelectronics platform source code BSD-3-Clause
> Linux source  MIT
> DICE Apache 2.0
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-firmware-a: update LICENSE entry
      commit: f741b4d8b92caf13aff99c11303a08385aabb09f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

