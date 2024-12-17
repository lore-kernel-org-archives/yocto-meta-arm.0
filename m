Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD99E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:02:48 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.82393.1734444160851950248
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Sd4td/Sw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6eeff1fdfso401171485a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1734444160; x=1735048960; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Be6gx3bOyfFtesUIm7gXW8O5O0DfWFPT5vcDwIkZ7yg=;
        b=Sd4td/Swhbe7B7EfmrE08i0eIPojs3qeMPlTU1Bti2yV9VfYBkifEbWDiAbQKA/RRt
         nd/WrlEHL14wbXXMYjqBKarDewIYuBh7WohgGkSvxO15+vV1+7XZ9ibX4fikHYKO6Nkr
         M3UGaXaqpqPTq/Et6LxlDXWpBAww2UIdI9+FukNmbsBsukjmK+PaFYX1yhbneLsjSu+d
         IMfhtjH1g80J/1zvUiNCG7NTD5d5SRBS4AtMrWY/8eE+T1mVLnQ2absy+y6F/4w1HOx2
         OwnK2ArvYrnwi9C3G6/neEJAdKTDnEhPw4WpK00ifqZkfHs5tCfWfgAuzKpT0flJWJiE
         gYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444160; x=1735048960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be6gx3bOyfFtesUIm7gXW8O5O0DfWFPT5vcDwIkZ7yg=;
        b=RpREw7LA3cmJhqBC91IdgRKPpPmaQZd+RS5mQ6X/esgmWxhI2AQGDiz5ueXHyatHNX
         BHDa4nBNtjwVdA8lIIrs17UzUGR1M6chVQK90Gb3ZKHDnnTX14ZBYAWYopQoXMKu6dK6
         +cpa3SRQgeKo1Out2Bb24kZnVNc7QHmlZ3LegGy2JmlNxlUVQzQWwctZ9hZ+tJWNvUfv
         OKNn5S7rGMkXSIMjUvsVCcPOJrsnSkN63Uqy6CiuQzdy7B5mvp7LPxULaIIfoWgLhJGu
         qwnLbKACAaPR8m+H+HWznM2Dw0IcH4CKh9qxLJbA3It3lqaLiYzOLR1TUyk+gE5gpUbL
         71Xg==
X-Gm-Message-State: AOJu0Yz45vZaZ4gDLpyRqvu0EzVMnm/1jbkgqan6TVsi5vAEG+5Z6hrh
	8PpQr11Wr+KI/0uIoHnP1MyBQU0UfGiWZryk7WEOKGevUhM0dgRPWZAMawvojlo73HnA17dIo2I
	=
X-Gm-Gg: ASbGncsHX0okGWFR7CRqnuljtgw70fPhoJa107l5OIfu5xVpgG41z+zuSSfA0qWlPR5
	IEMk2RNzWMVOOOiTXDfic1f3IVYq5RExL1qJSWs+ojITghc7uyHKgZneDLoxghHlOCKNd15/u5s
	srSdV0TcyDkziqBsqV0WUQKFwgUHhhHbgf1gs/tGVIdC1ODwZIG+txWzxsXEoQB7BlzqIJlTemj
	lS1JAfQK1yU/z+yDo/ZlHF/U0ykxR0I+CjWs4Ug7gi/wjTe
X-Google-Smtp-Source: AGHT+IEC+EgP03ZoXhNiOoyY08K7j7HuLd85krqU68IQfKGtNRETLARdBMJVy3qau/Xd85vaTNnpYw==
X-Received: by 2002:a05:620a:4589:b0:7b6:d611:ce82 with SMTP id af79cd13be357-7b6fbf77c66mr2638827785a.59.1734444159465;
        Tue, 17 Dec 2024 06:02:39 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047acef9sm319927185a.5.2024.12.17.06.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:02:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Subject: Re: [PATCH] arm/lib: Relax "Listening for serial connection" regex
Date: Tue, 17 Dec 2024 09:02:22 -0500
Message-Id: <173444414287.2113109.17454608122849745063.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216141757.1211316-1-peter.hoyes@arm.com>
References: <20241216141757.1211316-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:02:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6294


On Mon, 16 Dec 2024 14:17:57 +0000, Peter Hoyes wrote:
> Newer versions of the FVP now contain a full log entry for the
> "Listening for serial connection on port" regex of the form:
> 
> INFO: FVP_NAME: terminal_uart: Listening for serial connection...
> 
> Relax the regex to support this new logging format and change from
> re.match to re.search as the regex may not appear at the start of the
> line.
> 
> [...]

Applied, thanks!

[1/1] arm/lib: Relax "Listening for serial connection" regex
      commit: 5adb3155179b1b618a4c59911ada7659e1bee619

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

