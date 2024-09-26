Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A4ACDE002
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 13:02:46 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.42398.1727355763464575774
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 06:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=wRMgBdH+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a9aec89347so69108885a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727355762; x=1727960562; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRvhNFhmh2zduJYqXptxlD3rrXp4W09DC+Ix36eAZMk=;
        b=wRMgBdH+DQhl4MczkAbrC6AucDugzROuj2h7VMzERGKMGx0+0ZgVBMm/Q8kEduAiLp
         g3Ar3RhK9k9oJquh/4UQEnoxiDg+x1akj2CPDTPCXw4I2c+iuW7E3mrT+iTkxjQmYroA
         /hUb7LOf8DZL2mWX3/zQc0fnEGbC10FAMJcdk7vmlVz493Aa2/n7b2+s9s2yaol3gtwP
         N9RnCa14MChCC0na8DXk7u+aDI3GI0IErS5lOpsso7bUNal2tLimYdEps4v+UB0BDuY3
         aPXHogFEvpHN0lbL5KlGpyP3UM3U+t+WJJagUBhhw7miGDp6n2zfuJMiQ3IccXB4kXz2
         56fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727355762; x=1727960562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRvhNFhmh2zduJYqXptxlD3rrXp4W09DC+Ix36eAZMk=;
        b=gWHbyc+W/BcgfSNl4Ye8RIiTbA88Fybp9yZZGFmKhGVTYitLPSYcWQwNMEmvHes2vi
         lqil2SoRyRjTSKorKyEtGo4ilR3RkPSDAYoYqbcEEreuWNEeZrai+4uW7qj6DYYDaDN9
         B10wwlv/T8OKxC/SigXO2fMe5ldll7An2/q4iER26OClYUjn+tCKakpzO1I9wDlADbzV
         YXigQ3Enb1w28wKZhM++03s7X+kQcj/qJMQoryE/lIgnUWLc8Hx4N09UcZ24Y8Wv79iA
         eahSkQT0CVglWZSP8BbyRmxNAaHYMYgj77UydYfRCZS7m7bYvx6enxMVjNRyMT1EbgDu
         N/Og==
X-Gm-Message-State: AOJu0Yz0tMDbMSv8p4g5/VJ4D/Ry4RyrPqr8CBe5FFO1N9so9bluRpiA
	Gh9lNteg/KKNzq0bC+4PK/G6YbxTXiMDV0zYjrbtDC7kg7WHaHMYclEgbFwkdlJc6AdjcsSVZ50
	=
X-Google-Smtp-Source: AGHT+IFKwDBGmJ6uInxIy7pdED61Ce/15AoTCeuPRHQ6/qNsfagrda2c+8f7IqIFZKsQWB0F6jHagA==
X-Received: by 2002:a05:6214:53c4:b0:6c3:6b3c:8ae2 with SMTP id 6a1803df08f44-6cb1ddcd5c9mr90314036d6.33.1727355761961;
        Thu, 26 Sep 2024 06:02:41 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb0f552c20sm25638616d6.82.2024.09.26.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 06:02:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-services: corstone1000: Update Trusted-Services patches
Date: Thu, 26 Sep 2024 09:01:55 -0400
Message-Id: <172735571613.3501347.7667220685267000607.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240920152314.1752155-1-harsimransingh.tungal@arm.com>
References: <20240920152314.1752155-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 13:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6114


On Fri, 20 Sep 2024 16:23:13 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> Modify the upstream status and commit descriptions of Trusted-Services patches.
> Few patches have been been upstreamed to external Trusted-Services gerrit repository
> for review. So, update upstream status of those patches accordingly.
> 
> Harsimran Singh Tungal (1):
>   arm-bsp/trusted-services: corstone1000: Update Trusted-Services
>     patches
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-services: corstone1000: Update Trusted-Services patches
      commit: f7ea72db24ac6ec5d8e7116285bb0891f898711e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

