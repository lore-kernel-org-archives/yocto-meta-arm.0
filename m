Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83E5C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:02:57 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.1629.1743094972149044842
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 10:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=OGxlkdSz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c3bf231660so154559985a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Mar 2025 10:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743094971; x=1743699771; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BY2XBZJY9QXqb5kjoFssBA6zcV/8vPt5QfUgOaqjJsg=;
        b=OGxlkdSz1wqLrTyxw8vcgV1NjK+m6KCy1y+H4E8U1DWLuOEtJqEmeEU32he7yaeyDv
         xdUKNsu1BaMyiEYVP4OCj3jVCMnD6br3GBhw9FNx5jl+YE3CsohOkiZU9h3nl+XVq71d
         nQcszBkDvkruaUk+cyJN6DBz83OzRV+7Vi3Lpp9vCTzr/h50EWTY7VunLfURP/qzAOB9
         q3bM9bQBPrWVS8yMxqZown8XPaMvuocekCg3+3M1CM27aggqnH3aVgyqQc10xaC3aPpC
         JFB4cpckDQLjQLE2WtR1gefgZfjUVSwqIyUT8wUqT+29nnBs7tCSRe70ro42JgLefdCZ
         vpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743094971; x=1743699771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BY2XBZJY9QXqb5kjoFssBA6zcV/8vPt5QfUgOaqjJsg=;
        b=CQmTv7jpfYiMXILrHZj+DbT10cesLFpLCBwvQPvVFXQulEYZAwSv44DXzWgT07daF+
         rQpjQRbwTyUqNYv1auVgRHMOHpdQWpUDbJTF1qB47NNxJbwzMFyPHO7ZJskCAJPB/YJg
         1yL+CBtx84UTO0NnooYGVQSyajlntSOzzroatXnMlIQIL0Feo1MQieay76uNEeyMvgO6
         aMKPodzDt/G3fPnvJeiLa9eongQGgGCejg1qPDCsB4ymKb1KTpd4MsAOY6zJxLmSFTqN
         6pxCRJDHzlnyccu4ggXwipUtiEG4HepgbzKKppvXZ/4ESFJAiKE6yiDN3bWTem+FkCFn
         YC1w==
X-Gm-Message-State: AOJu0YxzG85HEJZap3Aj5PdpEXP+OMQA/AUzrWRXgaVyztfR75OKFj/i
	+1tyBqLnUtEbx/Cgt7q6wrQPkyyFPPU3pFzflD3pOi+zAxHgwADIT86N4MYpxdiWZbs43GeHivA
	kiQ==
X-Gm-Gg: ASbGnctsV/7iW+dCLTiH189cWIki0l8kfOZeY4uk8Ob19rtRHtyVt1MTGVYVAfQaNvE
	zmdQPI6YxVzsOIxtccctx8F+BkbiuuTMH6oZE/manrserFtIXjMbvJWr73mLdkIw6VqkmP0vW0U
	aNOdhbNzEbhk1XZlH973WzeYVZ/Hg3zSTm60V4JKxl+ckyGgO2KXJvIeTtGH/VCjRQYqYFPS3so
	7FdsKGewfZAUdL8KY91paQlpO/cP/+cwlvnP/0dhH+18/9yORNdJg5I3EsSgWDNIfTq5dM9uiY+
	IPn12H8i/phSPPYrepFL2PnoRnzv+otd59mF
X-Google-Smtp-Source: AGHT+IFUcmF1bMRl8PxBsPmMO/EZwoByNJQURiO30OarG3HenERVr8DmSRdQ+PgM2UdHiE853uieRQ==
X-Received: by 2002:a05:620a:1729:b0:7c5:cd94:adc with SMTP id af79cd13be357-7c5ed9fdda3mr687693985a.21.1743094970877;
        Thu, 27 Mar 2025 10:02:50 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7682c1bsm13553185a.38.2025.03.27.10.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 10:02:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH][styhead] arm-system-ready/arm-systemready-ir-acs: add version to download filename
Date: Thu, 27 Mar 2025 13:02:31 -0400
Message-Id: <174309495119.3447541.6954961253259850930.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326132032.423938-1-ross.burton@arm.com>
References: <20250326132032.423938-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Mar 2025 17:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6420


On Wed, 26 Mar 2025 13:20:32 +0000, Ross Burton wrote:
> The download filename wasn't versioned so multiple versions would write
> to the same file on disk and conflict, causing repeated downloads and
> fetch failures.
> 
> Add the PV to the filename on disk to resolve this.
> 
> 
> [...]

Applied, thanks!

[1/1] arm-system-ready/arm-systemready-ir-acs: add version to download filename
      commit: 9c548d16e099c9981b9b557ef2df4481605ffcf4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

