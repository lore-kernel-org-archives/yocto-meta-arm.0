Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96075CEBF61
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:18:54 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13292.1763396327401857252
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 08:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=j8c5tMiI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b25dd7ab33so290730285a.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 17 Nov 2025 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1763396326; x=1764001126; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE5WErx3eLhClCw5PDU6MK403/V4tRD1gPtmDFESN4Y=;
        b=j8c5tMiIDYd77IZYVkUcJIxAJ3p9Y8fyV7mHRYVkOD35kAY8JHK90C3+pK2SlvYEUC
         Z4wPQ4740/3Pri9uMuLEiMO9xVtdTduyVyXexF3g/wUk2RU039QT7EFFsLqugrMKjqTL
         OZqA03EL8R6iLmqXSmfFMdvgAtaERhCXUW08qghBvUbFqWo44paV1tr//oFAH23kIO5r
         XIV3cnHMhi/ghDZ3MY5LmpqQctbMR/7GkbOvbn74uFr+YhslXUNWizbYa4/ooxkTMjbs
         6uhFDDvIOwQoEPusXNEixFqkOh/MzM3OJEvwJD7rNSWXSsCfWWpl30aQDFSqwQMb+KGc
         Dp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763396326; x=1764001126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dE5WErx3eLhClCw5PDU6MK403/V4tRD1gPtmDFESN4Y=;
        b=vVCTtD+wGZZMhmicMI5pF3j7uhGrRwl/OXji/5+sZbs/naH3dm8w2Daf1Rp2a+IYvg
         AyW9gfCysw0yF4mWFLJWBjTNkg4emZ6ceSlzL+El2eH0BbW7lq1+qDB/+6dpu60JF35S
         wldrhlaCRm5wc234o41yBSj7fTq7HF3kgD/ecOOIhTeVeBYKEAl1O/lngU55XMh/G8M9
         i+T5poQq1Xueoz0TPAGkXO0CZqWxCwVatNzqMdlNB0+IeCCY9SKalx0aUunduIvlxVJg
         glXJykL3x7qIBdkz0gB42Pm/IJP/e6ysdiqKKWn2u7RM6XVhfyO8dBo0TuHHs8dMS1Zt
         puRg==
X-Gm-Message-State: AOJu0YxxBmGia6yevOzCMO3QM4NL1nKsoyah/gyEqdkX2Vp4kCfySAHD
	4Wt3n2wbpolfKe2azTeewPCm88gWlXj9tfZtc3JHNjhesBUSK4DdDYhayVFissTm5rXBnyCheh4
	4JPM=
X-Gm-Gg: ASbGncv+bVnq/lUTwmY2PzRkovN+RSCQpb/dYXCnIgnljymuTqdOSeCe7By5nPqbR7f
	9tdErTSdywaj3hm7d+1ZpQ7GdBusBUryMajLyI4wjA/mpQYEt580QztgMiWTAQ25xAMdnzMYXB2
	oh5cZikZipuhl7bEiTqK8XcsmeMKyRDsuNJCeWiaBwCiPDq+mXwh4FQG3qIYDqy3Tx8KL1T9vn0
	S+OBUrWOOQLdpkkMbxeXm6wJmA0xLDE934qnr7PzTDu+9+8SGu41xg0Tyx95t4Kzy9bWKfL3dlZ
	PHK5SrVd0z+MeqxlZC9JTbh7WUNDs6Rny8z6Ydn9caByfCMroOHizxuRNWg51Jfsm6Lz1kdlfKF
	WX1J7138c87Snm20yxd5vI6RVZ0x2owKz1qPDE0ql00De4/9M00M/rFCBb1CzPpUnfUsgu1pshp
	8IDphSi/edSmBR
X-Google-Smtp-Source: AGHT+IFqVgecfpb38fIYw0ds/E5DrMUESX4dsk+8lq2Hp0ElhxyeOIL/eUTQenjBArfmWQSNvPwSAQ==
X-Received: by 2002:ac8:5dcc:0:b0:4e8:8dde:9d7e with SMTP id d75a77b69052e-4edf2117704mr169523611cf.60.1763396325917;
        Mon, 17 Nov 2025 08:18:45 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882865cf848sm94844866d6.56.2025.11.17.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:18:45 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: Re: [PATCH 0/1] arm-bsp/trusted-firmware-a: corstone1000: Add patch for removing dependency of GICC frame for GICv3
Date: Mon, 17 Nov 2025 11:18:34 -0500
Message-Id: <176339631637.3301228.15857782343092989457.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251111165422.303832-1-harsimransingh.tungal@arm.com>
References: <20251111165422.303832-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Nov 2025 16:18:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6770


On Tue, 11 Nov 2025 16:54:21 +0000, Harsimran Singh Tungal wrote:
> GICC registers are not defined for GICv3. Trusted-Firmware-A throws
> error when GICC register address is not defined even for GICv3.
> Adding patch to handle this in Trusted-Firmware-A.
> 
> Harsimran Singh Tungal (1):
>   arm-bsp/trusted-firmware-a: corstone1000: Add patch for removing
>     dependency of GICC frame for GICv3
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: corstone1000: Add patch for removing dependency of GICC frame for GICv3
      commit: 548a5a8c36bfdcd56dde4569f735394ba66baeed

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

