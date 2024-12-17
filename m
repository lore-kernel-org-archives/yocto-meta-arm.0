Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF652E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:02:38 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.82383.1734444152250653336
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=IAX9Emik;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6ff72ba5aso300309585a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 06:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1734444151; x=1735048951; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufWVji/tisk6nz+hCq7yb0WQW2Od6gYwGVTYw1nP2+E=;
        b=IAX9EmikA+YnnB8EJxHG04GL0u0nffDwKWnJbu+OoruYsBFE0xGRD/EsS/NhGGkfFQ
         fQlz3dph7iXo7l4cCIwgvfvW6OQ5E6uq+Q1M9S9/hY0QqNKuSzPilvs9IWYQ4Kq9S4M7
         lQkU9ZLyupsna5jh4pOEPGvLxQ1/bMLDxS43uwd/18Hy3xKgTKX9LXqtDneH9dfUG1Zo
         XrxwNXlY864fmIdNDEZiDKh6KozfhURA6ronU/4KujiwlkvK4wnEewKjXw3CfT2jlMGd
         ptiz7c55bcZIlOCu+XaZPkVssjHHOY1ckI7Bmtc7eUNWWF/w67x3c2ZWya9ooXHEC6Gl
         ivvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444151; x=1735048951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufWVji/tisk6nz+hCq7yb0WQW2Od6gYwGVTYw1nP2+E=;
        b=BixF/8pR43SUfSqfapR7Y1Ma5UHH9j/dIVjHkuMOrkcHhKb8bmkA0ZDfkj8V+/SpxX
         c3sZv3PE9bT6XVs7MYlJped8E2bq3KY/v5poK+iMHWc1r+oyGx01Yzr2nrzNoS0T3Gh1
         E1pbWoBVvVfnf1sKpYOI/J8d+UubdWlCNmyASVgmGnS3KMWmUCytpqJQOxuMwRQGZLU8
         ax+9XeIeGKlwUA61bayCb1PYxotdFYwcrwC3CUbxQKHnF4D3ZRHhk/TwswWpP5f9STwa
         el5J6/AtJSb7PYvLiTqZyWrGaLOr7epAUOmgzOsqg0pLgZ/bsfspbu4alUKrra4/UuO5
         hqDw==
X-Gm-Message-State: AOJu0YwMIGbRhsQGJa8sRaeUkMu3fDjg3IO+ZjlQR9WM4gBLkP+NtrNj
	CjCW/9xNKWw/StvyW47NYBupDHQkGq9P/70J23Mq2mOdFcBvHC0HpPum+V1vnYQkPihKGXa2nMI
	=
X-Gm-Gg: ASbGncs4PSC4c6D5Jnfmvjf2tw6gNmhBvt6V8hE8vwstEbMuhGpazgoBf8eYBVGIom3
	vUZZ+fuOpFtj5fczsKVJAMlkaX72GLUylduz1KzFSFZZtwESULxx6bU//cuSs4kbyg6rPw3piYb
	kVgoF5EtdqG5u3hiTRcqNBRFRz8Yc+8A16x39gcIi47meTA4ozPd67RXPMt2ggRNdfcHDZqHkDi
	jFTLf8K1QT6SOR7DB8Up36Tq5GkSteUMDtADrHWVDe6M5ah
X-Google-Smtp-Source: AGHT+IGjnbd8M50Ix8zw6pzm9iDxvcxGaJu4VH/otpia0JCZqxPSdyxBkvecyEGoh5l39FbNEA1uBg==
X-Received: by 2002:a05:620a:438b:b0:7b6:d252:b4ef with SMTP id af79cd13be357-7b6fbf42a16mr2479316785a.53.1734444150983;
        Tue, 17 Dec 2024 06:02:30 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7048be4d1sm318774785a.70.2024.12.17.06.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:02:30 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	adam.johnston@linaro.org
Subject: Re: [PATCH 0/1] arm-bsp/corstone-1000: IMAGE_ROOTFS_EXTRA_SPACE workaround
Date: Tue, 17 Dec 2024 09:02:20 -0500
Message-Id: <173444414286.2113109.9133235580938408531.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241213141027.486517-1-adam.johnston@linaro.org>
References: <20241213141027.486517-1-adam.johnston@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:02:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6292


On Fri, 13 Dec 2024 14:10:26 +0000, adam.johnston@linaro.org wrote:
> From: Adam Johnston <adam.johnston@linaro.org>
> 
> When images are repacked IMAGE_ROOTFS_EXTRA_SPACE is ignored.
> This is not necessarily a bug but an undocumented quirk of how wic
> works.
> 
> Evaluate IMAGE_ROOTFS_EXTRA_SPACE and use the value with the
>  --extra-space option. Note that, since IMAGE_ROOTFS_EXTRA_SPACE is in
> Kb, the value for `--extra-space` requires the explicit 'K' suffix (the
> default is 'M')
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone-1000: IMAGE_ROOTFS_EXTRA_SPACE workaround
      commit: 3df279b56a20187b22f3a772938525d7e3104f77

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

