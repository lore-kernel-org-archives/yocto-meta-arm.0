Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6D0C36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:33:31 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.5349.1743564809067613603
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 20:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LCpFdxAC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecf0e07947so4794476d6.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 20:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743564808; x=1744169608; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjjal6bZf8lSl7KxnGadG7WiwEd+pCQASR7sV3LJbOs=;
        b=LCpFdxACoO/wSreM5L8wGFsEMO2YCWSXuMx/EACFMzZtABuovR/PO8fAaDaMf9rR/8
         TuwqYmSu7WVCpRS8rr36DIPdoh1eYeeXvbOrIVYFrYR9HR1TEnZa2MZJ9ylaxvA+gM9i
         eTIGLMzkDjDMnajmWGOSjM+tBisW2jDWhf+7Y49yaPSZedHYUfXyChP+4A5+zoRStXK3
         g3EuylYcd2rROgM/T39n4qDcR2xQvQAFRhjDzWF8neyqq9Cqtp9tgThuGPEgHdxdOZWw
         CUlzFXudP9S78HW7YPMevlf/KcAwBSivrOY+xUiTVlVrF2n6axau+KvX8pXPYFgZjv+N
         a8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743564808; x=1744169608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjjal6bZf8lSl7KxnGadG7WiwEd+pCQASR7sV3LJbOs=;
        b=rLD4kvvYuxQWYT8ZTpMAp4hA9RNU4mcOegAWXyALr19aFhcQ9TffYDMR+aPSjS8AQq
         1gppWJyz7/Sr9lGBEYDzhoCToUFW8cVeI8jLMKsAOKpUc3NAax+AU54uCmY+4YFDrYDp
         hGQyLDJGIgSUGZ+9VLXpCyNCCJmuFx/nP/5jsQGvprdJkhIu34ZACiNw0x5M5MiK7T9O
         POvy3yQLbeD77brlAajf/5kT/YPrH0pai0XVEUqEZluJm6wVgzwQH7ShDtW7KpRcoAk1
         E2l+OOfnfd2UVEFesgfEW+DC4YqdZxGuS5yMKWnT2zsSsJgU0E/rty+YHrMRRzIh73KJ
         P5Bg==
X-Gm-Message-State: AOJu0YyeXiwQREElOaAOxh+sJ5v5M2lFxle/hTK+kYwS8CFO7d3gJ7n+
	FjBjk9kITvnsSArimOh0G7X2lyuvxJTNU/a8zrnYjWlt4jOF5ZU3koflMKbP5yNx4m4AT2YydyV
	NiA==
X-Gm-Gg: ASbGnctMUZ+dydkXJY8A17H83Ii6A08EOHqw2BBCb9tLt4FiuhdvJECfvUc2jXDMSkH
	EzCoUowK/lMJtCK/38v+TNjIA3vuoDxSf1xd29FvtXl88dyKMojOjCh64r1poztCL1kINCjYIYe
	1oKtInz+UNbEqTayu6iJOflTvqNUjefuvRJqPyYcCDngnp+xI9r+XRUSAxvA8b2zckCTiQr60A8
	frmKoP76UpGx4N8kYyHHjw3micsvT4ne+21euwTaBbmJlm5s7yoMOW0DxnMk/lSE2QMQ2em2HJn
	ZOITGTf+TBBbnLsPgmXrYOk9ui+judKr9i82tZrAcLOhBzw=
X-Google-Smtp-Source: AGHT+IGxOEw+x2gI/ADb2kohS4KlnOZ6eiYFkOwCnhB/bnhyYx4ngHhWW3kgyn9N02jFbvuJJQPnnA==
X-Received: by 2002:ad4:5ca8:0:b0:6eb:1c23:63c3 with SMTP id 6a1803df08f44-6ef04796b8dmr9596796d6.0.1743564807771;
        Tue, 01 Apr 2025 20:33:27 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f777d4dfsm741467985a.98.2025.04.01.20.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:33:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/edk2-firmware: Fix branch name variables
Date: Tue,  1 Apr 2025 23:33:13 -0400
Message-Id: <174356479871.2646952.17297300651694557914.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328132903.66472-1-jon.mason@arm.com>
References: <20250328132903.66472-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 03:33:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6430


On Fri, 28 Mar 2025 09:29:01 -0400, Jon Mason wrote:
> In the SRC_URI, the branch name variables are switched for edk2 and
> edk2-platforms.  Switch them as appropriate.
> 
> 

Applied, thanks!

[1/3] arm/edk2-firmware: Fix branch name variables
      commit: 957fcca083c39674b2eb98c5d53aab5d5ec965c4
[2/3] arm/fvp: add TC3 and Neoverse v3, remove n1 edge
      commit: 3bf8bf5d4df92fdbcc63e6fdba756e29e2c66447
[3/3] arm-bsp/sgi575: add FVP support
      commit: f94c002d1d8347ec135dea4fb081e1e37ed87b75

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

