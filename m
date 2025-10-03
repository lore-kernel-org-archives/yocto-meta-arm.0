Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3F8CAC5B8
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 02:51:47 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.5493.1759459899872188485
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 19:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=p0mcZBLZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-81fdd5d7b59so18457176d6.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Oct 2025 19:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759459899; x=1760064699; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU2LNfzdumnjtbsbN+lvUUd2nvkAEUz7wa7WqsyksLA=;
        b=p0mcZBLZ/5FF1iVzwbCjPtxKPuyeCjJ8YvirlKzXlc1g7b/Z6Sl29OyTbd7OtSrZHn
         qMj6VXo+Pmr3B7uMSinS1vD+GbIcjiViRhgtt2xAPeyHz01F21LLBsyuRrHszh2dcHN0
         qftqjxVvNJx1kb0ODRGk2sAHuNLazvW14HGrfhQYS0iXYieVrE7TzOcjhPzEl6DAwQIX
         N42ZiQexOvCQMtob+OSl1TklIFuEIWkZEHPXNf/sJj/3wb0SuAbacJWDZ6sjgVD3PUzP
         r5i+8uBGdDimoUB0Z8ZFeyU5S3XrVa4ERwFhJ2y/Q0e7HbELlaVJMBzNb4VnvMazydH4
         Jf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759459899; x=1760064699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU2LNfzdumnjtbsbN+lvUUd2nvkAEUz7wa7WqsyksLA=;
        b=Xtql+KxXI5j2dtXK53PuUi8ItcXmmnCYm89CG04Yfv1SwwntwNd/mfTRIF4N2NVgCW
         hKKtanj/TU441klaQ3YNa7wREwyAZVHMLuSLhdn1SozQ8GBrCq3HGK3nQQbdKdGzHZ2v
         7vxw3jd1lPy2wQakNWp7DTATC89JKBoSoKMZiKvkTFs2282QkkMUbMuI/sb4AX2TQ/07
         3gY4FevBqQ3Icyzz/r6CUZkH4fM1hnAo48dpusHVGN3yi/IjdUfXzdiHVEQtIrXTGnYE
         cjkBQc66+U7SDwcewNN4XPVPsqdsFng+PGOdRdVGI/qK5U5xw7wbwTJFzUX5iAvhdDTm
         s90g==
X-Gm-Message-State: AOJu0Yzbwg20gQBF9DGTkVe+UmAbELZ6qCCKT2ww1JSMVfiHwLK6d5AU
	s4/m2cATfbe82Hmnv4+rIGuD9dngdsT5FZIkWQ4Hws3kLFxHMKzuBu7WObv6vseAvXuAIOhHZhV
	9FHo=
X-Gm-Gg: ASbGncuwPBxAmvCYKF4dL9h+ozXHPsPkcVG0voJFtKkogByD46rU8mZt45+21mXUSST
	Vq553CSlj3lkrs4RvkTl0kwFSfvG9YlbhzwEroxSZojIaXsMcoSbW2iKQPVsFXU3SrxfqxoiOan
	8OutiDG30NmnL/VMRuTaZyiXETbUe/IZOuhUE1+EKVP5pi3AXmo6X0kxffdG/8HXwvwqbvzZSdg
	DeE9/2Ood+Va+VbYMXXrE9v2ycHjOeVx9mIz+k6VCdfLt+xzXwgkHEYb52j8SI1d858G17fUiu2
	1dNFvK6tiMGI+eTpTVm7xPgR9dQpqvxhy9h4nGEF6/L5Qo41hq3j0lkJ6RMmYoWhgdaoVVDO0Dv
	TQpVSErGZ9mTrhTwhXku0dKuSWZ+iQ3OlFLFsTg==
X-Google-Smtp-Source: AGHT+IEhp/WEOclt/KjYiwe+XSK76gbgU9yf4tEKpoFpZ1a1pRZRkCN59Mb0saO/uhc6/PUmjJBtSg==
X-Received: by 2002:a05:6214:20a7:b0:7f7:777e:39c5 with SMTP id 6a1803df08f44-879dc7c3a92mr24694146d6.25.1759459898584;
        Thu, 02 Oct 2025 19:51:38 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bd786797sm29038566d6.39.2025.10.02.19.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 19:51:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Michael Safwat <michael.safwat@arm.com>
Subject: Re: [PATCH 1/1] arm/trusted-firmware-a: Re-enable BL31 console by default
Date: Thu,  2 Oct 2025 22:51:32 -0400
Message-Id: <175945989237.3615376.7266725723802921730.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250930154758.2465614-1-michael.safwat@arm.com>
References: <20250930154758.2465614-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Oct 2025 02:51:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6724


On Tue, 30 Sep 2025 16:47:57 +0100, Michael Safwat wrote:
> Backport Trusted Firmware-A patch to re-enable the BL31
> console during early boot.
> 
> 

Applied, thanks!

[1/1] arm/trusted-firmware-a: Re-enable BL31 console by default
      commit: 18cc301460be85f24d34019a878cf70627c97ed1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

