Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79383C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 17:17:39 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.37281.1698945450885397463
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 10:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=e8pNXm2m;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.46, mailfrom: jdmason@kudzu.us)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7afc13d58c6so455661241.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Nov 2023 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698945449; x=1699550249; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QrdKPX03sD+5kr7aeV0ZARjAD78g5bFu/PaXhvQt80=;
        b=e8pNXm2mZgai4Hy7p2XZIQOK26IcrGcsHQgReguVzwr+fLARN95dbFwTvCqAtYwaZe
         B7LT7aRCqPptlWiLVN/WzrXaAa/nNAQrY6CxY5zpUZ9TgUDd2RKXR4IxyfaxAm4pSAlQ
         1u5Qw53xzjD1renfkvOH3M69rpf4RMMhdzplXVxixe8HlKjYlibRkvE/Ocx/xyeF/dvy
         58Pua7w1TuMFJWr61xRUSoVtM5+/v0DEJa0LQcRva+Nsi77BlYQqS/DMppQJVlS6jfof
         KdH/bsW4Xc1W4CqzBnOWz2d1aFmyfJaORe3tpQcdR0UH916MEFDeVad5ssdUeRs6Yl55
         jwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698945449; x=1699550249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QrdKPX03sD+5kr7aeV0ZARjAD78g5bFu/PaXhvQt80=;
        b=bc4vRhtVprbkcDArO4JB+uCKG2DxOZndJiijWri7oDswdEr0QAsoqbfQQ++g4XlJ6N
         pB13Xl4gc3KMKeMVmyHsLHfsIz1az/umGL+sFTh2b9lO+u62Gvk6jAYsCXU35jNJybbo
         7vmElBhgBOOrzD9FpTH2TCwwpfYNNQSexRFN6d9RpxpgdzDgkIDtb88iDLxoTiQOBVg4
         R0wJXcp0oKm+YavFzSbehMfAaWyJGCnlaPO2IbmbQ/6n+UFgAeWfU00t2ptW1vfEldK5
         +IpodjcIO2+cnY48ilH8hyZpvpYfFI0FSv33UsYQNBanahwxXmNXmt/zcwMwDki2enCE
         /E9w==
X-Gm-Message-State: AOJu0YxdzU1fDiZnyJiSqWRvv8oKxygTXSIcar6L+mwfTE2ZI+iqh7TN
	Vwnh9TlWndKjNclPd/4Alevw11Q9d+57WCmPUUE=
X-Google-Smtp-Source: AGHT+IFR1+uN+1VaPXOFL7sz4hmtGfSkL/xUPhy8Fh4SQFl5ehe6ADmDlQ0UpxPcdRepmD49nQ4C9w==
X-Received: by 2002:a67:c09d:0:b0:457:670f:e2eb with SMTP id x29-20020a67c09d000000b00457670fe2ebmr19612016vsi.20.1698945448921;
        Thu, 02 Nov 2023 10:17:28 -0700 (PDT)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w18-20020a056214013200b0065afbb39b2dsm118567qvs.47.2023.11.02.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 10:17:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: Re: [PATCH] arm/optee: cleanups from code review
Date: Thu,  2 Nov 2023 13:16:28 -0400
Message-Id: <169894539036.3995537.17398298182273789553.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231101143548.2175-1-jon.mason@arm.com>
References: <20231101143548.2175-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Nov 2023 17:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5197


On Wed, 01 Nov 2023 09:35:48 -0500, Jon Mason wrote:
> Comments were made after previous optee changes were committed.
> Addressing those comments here.
> 
> 

Applied, thanks!

[1/1] arm/optee: cleanups from code review
      commit: a25a782b45ee55b9df9b3a3135256c2122fb1c73

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

