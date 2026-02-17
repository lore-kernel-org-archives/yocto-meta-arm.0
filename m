Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A49E83850
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 04:39:03 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5758.1771303132346053545
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 20:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=HrSwcZEP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8946e0884afso68141056d6.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 16 Feb 2026 20:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1771303131; x=1771907931; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoY4nVe3mnit/iLSrfXdbknBiAOyN9OvXZv7sjl3Sko=;
        b=HrSwcZEP1ZtusKMogLfEozVuZrjauNafo2uQLa9Yj9XalO+Sh6SEhp0LeCGE2sXPBF
         QaqAY85FHOvUW0Z8qbJYLUVVVPsAnbAqTqvYJNrdam00Yxqx6YpRYA19ZiIabe3KWLpk
         H1tguuGszj+qQkVj3jNJJdfD1u0QnpfrqZnXvv4VIfo+5R+wqwqSIKNgtDpzvIS3QetG
         bb5duOE/ofEjhxYPd23gFuSp+B93wPBgJ6YiCgL8/6fN4YWU646CaLBi0Y9yrr75Fgmn
         CsHy0GWTspmTWD6005ID6c/BzZLRpdjQcq/0TIi8XAV6g23N4P4quoAhCFuxJxqN2EZT
         623A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771303131; x=1771907931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JoY4nVe3mnit/iLSrfXdbknBiAOyN9OvXZv7sjl3Sko=;
        b=thLSHJo6nKpWFMLBIifZRnMlrEFLZjqlLMAlh76n5fpDql+hhcUK4tAtebONezC2IT
         qDCI3wIo/H7Dy0BeyptrVke0kUTUhrqzo+apws/OWTDmjn1/c3VJRVOBaI35MYZDy0Dy
         QxH505+T1XznIdqSkPRqg+eQz7pQIRLKI+D47kNBE4/Ha1BJNlDRVV1Tq00uuBNN094l
         ADWebKSFHAyLCK8ppGORn1xnKz2UZJqJl/ZsYsR3nhPqatfxj3XNkvhOhxxgHPBNNXEh
         GagphVN8vJKTNalkh9cD/ft0DmfCpdpsop7Q1F+bK5qd5qpj0HRiJgPjJSf6blPXZVkq
         kSzg==
X-Gm-Message-State: AOJu0Ywy1utZuG+5g7Z4MzAfHoL97svefgFRCDGNo7PDhDHXKoG0IcRK
	lKj4qrRvNhR4SGvIpygdesfFPxnCvhbxiJQIRCj598zHAlGuzjwKNzJpMS25luVJjQkWB5Jj9Q1
	IW8M=
X-Gm-Gg: AZuq6aILo/jPoqYVBaCPI/rkqKvrkoaUfndifPbLoa0Geb6Ryi9EvBbFuOSfRyGM04u
	+4L9vjU54d0Zfi2soLNpTpvxQCt5NqAu9vTuVmym0tq0upp2dmtSdLlxW+z20BrDrcCDJPRvWUc
	u3ximFkHkL+3AvPGYbR85wNIK+EtzaydExex/21TBwCZ63Y7tPTQEQpQK9HrLsBMhr7v1RzUdtK
	Wio/zTCM5w3qgzfuL1ETD0VPyo5OEBBP2NBfcn6E61x69+yoK5rl8VDyFtH/CSsxGnc18YmICgn
	zmxghnb9l/iVEJBG0JfQ98xNHQ6BC6G7bJynXuducwuCivXXZvHixgs7VDfXuveK4BA3qsIUKRs
	xfbwH8iRaxeoYHc/XMXxgJLKVlwJjpPvLo5bntrCYIt0OQVM2VUkLPHbhn2AjEqH8R81Oyqg3FV
	/r0h/w3yBZkX93
X-Received: by 2002:ad4:5c8e:0:b0:721:a9d7:297a with SMTP id 6a1803df08f44-897402ddfd7mr140312856d6.7.1771303131153;
        Mon, 16 Feb 2026 20:38:51 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c883dsm1416350185a.32.2026.02.16.20.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 20:38:50 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] Remove meta-arm-systemready
Date: Mon, 16 Feb 2026 23:38:42 -0500
Message-Id: <177130312254.924906.11064298849610861116.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260212122530.342854-1-ross.burton@arm.com>
References: <20260212122530.342854-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Feb 2026 04:39:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6912


On Thu, 12 Feb 2026 12:25:30 +0000, Ross Burton wrote:
> meta-arm-systemready was intended to allow people writing BSPs to run
> the SystemReady Architecture Compliance Suite[1] within the Yocto build
> environment. However, whilst this seems like a good idea, there are
> several problems:
> 
> - This layer only supports the IR band and v2 of the ACS. The ACS is now
>   at v3 and the bands altered, so there is no value in running obsolete
>   tests.
> 
> [...]

Applied, thanks!

[1/1] Remove meta-arm-systemready
      commit: ad92b476687feda58a99ae790c235f18515e35d1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

