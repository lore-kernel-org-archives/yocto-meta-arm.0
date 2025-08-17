Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95480CA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 22:16:43 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.62105.1755468999802657183
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 17 Aug 2025 15:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LfE/vISH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70a9282f475so32578296d6.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 17 Aug 2025 15:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1755468999; x=1756073799; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pp63I+lXUa3EHF/3ndlBNR/ij3TgUxhjCbEqLS0s4i8=;
        b=LfE/vISHoVbXzEF/nxALYLz3ZpKjv/uBbNR4K+ILBg9lXsTicYJ7MNWRSRL/vD9SMM
         /gbCTlblxF4HVFlf2hN96T4vIEUHh8qDSDf0AWf4nnblTyr0ois3g4sxw5Ehiokmpv2C
         3F/2035rGssIWzm5WQmbssprmJaJjAJxE4o1bv4OmGnJt1mtxtixxuyksBzs3T7dA37+
         aXucskZDTLoquzm68v2WSHxc/8oBbkZmokDrAiPQ3g/3qkc6664T9bdpRBKgeE+ByxDT
         mjFyuym7z/Ha5KQZ0TV6bTgYW9E10NBPtkr2xi5c1K5uYipxX39Gto/2y9I8Cpi+MEwL
         7Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755468999; x=1756073799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pp63I+lXUa3EHF/3ndlBNR/ij3TgUxhjCbEqLS0s4i8=;
        b=QnYJRz/3WZiPl6GbkKvRfunhOplzVCK5/h71TFWb7OCho2tra+xxgWHslyzGYwKEDL
         hYWB7Jhczh4f7P1OyoTqGrS4gJjAoTLUuIMuV9LSmKbSPo62NFgd5vc/ewTDL7wgaWcu
         slwqg8fEFi2+MUQxbJIrdHEJj58WxtPctMYKR6lnVqz/qtSH9+Q9eSMaJEopie/Ku/Gk
         rKhUzeINz+L8L80w8WU+Pcg/95hQd+WU/lrA8PAdXM0BaBue4MOpGElsnvrzvocWiCZA
         HjoXqInkIWxJ10fhiVahTGU06tGjO40RNRVv42uOCRDvQhaiM3rXDkJIya3XLnHl4DzX
         g5Nw==
X-Gm-Message-State: AOJu0YwP23Ohrxtgimj+5QJnR+Sj+Yz0WHB6Ox+zau9KevoaWRwpoEO9
	ReWpyDul4QvQqaSH1OwjkApnXgPlXtZMxpIbWOhm1WWoAcxT0P3rgTp5nJLvlP+bWE6b5zXUXty
	hdXM=
X-Gm-Gg: ASbGncuYXDLvlRONmbyEFZCXtMzX2G5fNiQIeS2d9FMJ9/tFERjoIdUTbek55cy0FDr
	3VBfB/2AlF1tmdusBxDOwpsX2b68SA2Wy0/3FScEwEicffpxqEjQRvUa6v+zsG/g8kg5bHlPRvW
	LMxQ5x3TMT2MjqvXOJMgFBln7QFNwMJlPa61UdYa9YoPFVeyPy29rDU5QWfGQbIS6Iyj5bThrff
	G9b/UXMROPSGJy4ZapKK09bSZnt9wM0hsCEXjj2agt7q6nxMChQ4RP+amgyNgvTUBeMJDUwNlyW
	nWq5P883MfbuP7MypjQKeE33jLlNN1J7pEWuW9MJnz956yVc5UhUiPzq5GWXrAbw7RQfBZQrooT
	RVoEDTbHe8NIn6g==
X-Google-Smtp-Source: AGHT+IF5FUIP9XcpcW5QRzgYOyY2+ASnWMKBIUkEe6J4X0v6ROQLN4U92si8nfw4gMWC9Kr/Rp2+Ug==
X-Received: by 2002:a05:6214:c82:b0:709:243e:9327 with SMTP id 6a1803df08f44-70ba7bfb5e7mr142625576d6.27.1755468998551;
        Sun, 17 Aug 2025 15:16:38 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba95b8f10sm43209066d6.74.2025.08.17.15.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 15:16:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Subject: Re: [PATCH][walnascar] arm/classes: Fix IMAGE_POSTPROCESS_COMMAND in fvpboot
Date: Sun, 17 Aug 2025 18:16:20 -0400
Message-Id: <175546898074.1250199.14289394878117906052.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813080700.5225-1-peter.hoyes@arm.com>
References: <20250813080700.5225-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 17 Aug 2025 22:16:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6667


On Wed, 13 Aug 2025 09:07:00 +0100, Peter Hoyes wrote:
> Since OE-core 6fd8af0d, the semicolon delimeter in bb.build_exec_func
> variables is not needed. The commit silently removes any stray ';' but
> failed to handle ';' when assigning to vardeps.
> 
> In meta-arm, this has the effect of changes to FVP_* variables not being
> picked up when rebuilding the image recipe since mickledore.
> 
> [...]

Applied, thanks!

[1/1] arm/classes: Fix IMAGE_POSTPROCESS_COMMAND in fvpboot
      commit: 60c7910b410deba56d51bda038734802e67fcaf6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

