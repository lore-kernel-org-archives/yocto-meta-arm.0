Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA6ECDB46F
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 17:35:00 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10230.1781976891783698510
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Jun 2026 10:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=iYc82Bn6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9157b949fc7so319180885a.3
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 Jun 2026 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1781976891; x=1782581691; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufaZ67SxT8KWqXpeu8C5PMcJ6o+9DP4udyzwI4BnVfM=;
        b=iYc82Bn6yTwwKcfRbztJaErOd3obun0GvkjoBSfG/AQPbljTbZSD83m/29HFfRb/ZN
         +osqh2/tLAT1GUim7OiVyr8xXwMSMdA+9Jw8Pq+qgWyg2Yq1Gt39O3TFvytWTJptmIMj
         U2/ccAnnq+pGrVpBgcq0LvcvPAP5yOV+CkguiczV9soQM6WyTXPLQ7+fzo3ChlZEGwPg
         hsPRTEYoMzSErLBtgikyoH7BN6+mSfGNbeEBkIOHFmDDI2ORf1AcuTGqbCE9ej3F1OHH
         NogvtGZMMxKX1rhBATHOi3ijxULElTjwOIruEBUQy9Neq20rQ/GhbR1Ve4r69gu+akjf
         gdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976891; x=1782581691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ufaZ67SxT8KWqXpeu8C5PMcJ6o+9DP4udyzwI4BnVfM=;
        b=ngDmjvD65+QGThtABWPpQ46uP5tOxwFqGL+L26d0Gk8UNGKPlWtS6BHKOYskAqh+HO
         0tYmJvSXbvHJhHW6rQYai6+bUJRRkEFo3mV/y/9KCg2xT4tpczwI01pnxw2gpexerj1m
         l5NFDl7jFNS4uo+ot4M1DaHZCR+QJgel4ISMtg4yHQ28HrXpETlC8DuYjRmujSN4VIXi
         jrt6hTwuY4J9ACTC2sy4uNqhabrQ/lqvLJWATnMsd0iXL7GTHALooDyChKrYt0RSRI7D
         zYcM/NsAluYt2I8kyetfYPbeMLYeE7DVLi4wac2eEPeY+mWPAV+BSJcc551FOStD05+J
         cuZg==
X-Gm-Message-State: AOJu0YxGJL0qSbrQ38eY/FW9xJsd/dltS6CiSw4bSmGqWvMjuoJTTq8Z
	8VpQWzghPY6MwzZkmuzl/78gkgiQoKuRoSz++Yl9I7KJcZolTIpIt/+BKabdK/G4oicMVwXTyXz
	u3R8NaQ==
X-Gm-Gg: AfdE7clr1CzHs6qCog/KZbzrwJOtFzy/yfAehixN0IJraHRatc3wwxdMQQMeG3GJa8x
	YDCFbXgyDDqxBKT6RSU8tWmqg5PWh/wiiaSqJHHsZ3g7EQDBwbuqVAwtIwa+cWpd5wzFNnlmGVa
	lzTPnhQxpVYKwDtSfg22ZD7Uh8FrJr1GlqAhIN5Py0jM7LR3xr7nhSf27PTscDn5Qa+RA8FmJuA
	ZFlabKZzUKhLPodZzvv1zAezCRu8AXHssWQRrfhpweWv0Kpyd+xGPN4dDSuMAGxYiiU65iS9eHo
	Yay01KIc1VhV0yOWaxyxlovx6j9rnizSqS4f3XvuTpXoaDVA7pg0Gq9JwBrFaa818A7D3E4vKi+
	yEdErHPUXlM5XqosGkBjEKXLmO7i5sjx7NWFgDf0iYYFpb+LhdrZO2kbNx3bCvX39ECP/tHPyiv
	zYSA==
X-Received: by 2002:a05:620a:179e:b0:915:ab83:6952 with SMTP id af79cd13be357-921d124a3b0mr757781785a.16.1781976890690;
        Sat, 20 Jun 2026 10:34:50 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-921d7965688sm365431985a.2.2026.06.20.10.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:34:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] CI: use Musca S1 for LTS testing
Date: Sat, 20 Jun 2026 13:34:38 -0400
Message-Id: <178197687884.4020114.239577994752630283.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260615131721.55897-1-jon.mason@arm.com>
References: <20260615131721.55897-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Jun 2026 17:35:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7094


On Mon, 15 Jun 2026 09:17:19 -0400, Jon Mason wrote:
> In TF-M 2.3.0, Musca S1 was removed, but B1 is still present.  In an
> effort to keep coverage, swapping S1 and B1.
> 
> 

Applied, thanks!

[1/3] CI: use Musca S1 for LTS testing
      commit: 22de042eaf68868331741bc33b9c00e73b865d19
[2/3] arm/trusted-firmware-m: Add 2.3.0 Support
      commit: c5df984862e5678266b087c62ff7ea878b1779c3
[3/3] arm/trusted-firmware-m: remove 2.1.4
      commit: d718d02774c9b29f7bb925ab7255f26eab04301a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

