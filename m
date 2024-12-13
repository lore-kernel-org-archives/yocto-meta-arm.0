Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836D0E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 04:32:00 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.8784.1734064310919840670
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Dec 2024 20:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=D6SRIjuF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6c375b4f0so126765085a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 12 Dec 2024 20:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1734064310; x=1734669110; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zszDrneotceb2DpAvLm7WyKjAwur1QN7qIpeGOudl94=;
        b=D6SRIjuFxdcR1pFEA5/7Fa38hBnLGaZV87dcUWlWDxq3MEp6LSX2tDaVNwYSVGOvsF
         gV23J1fOI+dp7WVsZ4UjDG4WMyXgV6TSE4hAJd7fAg22otM/cRmQkmQ578as+8fviyjy
         HzQH5Lnl7ZbDssl2I83m0k8VoOAb2J/UXlom9RcZMHCb/dHMyke70CIkv69bv/43dfK1
         ysNGf4hYRV073a9uGjiQ5fbg5vLUkcFrHTcZnCcNwnKu+N6sNhCwzpZ8Rwh9niP6GUbR
         KN00bgL9BlT9LnGe1VEDparv1eqsMHYkBsZd5+V163wZQWX2CBsmCY12Ia9D6k6bmgr3
         Z+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734064310; x=1734669110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zszDrneotceb2DpAvLm7WyKjAwur1QN7qIpeGOudl94=;
        b=k8COgCi/F0sUOFx2aB+6M2xVj936BurulV9YmYxSozTwDcLDbgAipNfn82eNsemfLK
         rhb/EoR3e21uRhRNPvv646YlNX/R6A6FDVak5Kg7aiWkKMD2K/ZLfH0/0pLph9hoDBhB
         nBQKu5wNSJl/U6Fv8dcBgvlj9REMAHiZ+0RFoTi5TUAXNmYP/3jbj1e7MR4bc21BCueh
         khpiapu78f/471RmoiwdKTJzKj2OzHgSjlgyZb1N91uhaoxEnkn6+QNOIE6JAxG7+RI3
         RnWPTsay9izbioDpjYQyIRnGa08hK7RzzArR05AjsWA/YRLVJE4IV8zAmSq4C8tiUycv
         wvPQ==
X-Gm-Message-State: AOJu0YzD9gfZvkn2lirCh4AK3QhQtu0ZJZ651l2kvXai/4jHueH4Aylo
	NsiP1o3nutwGKgyCnVN6Tb//RcnAGvalWAASRWWm+AjiWIoh0WY7XZlDkPtm0xev1DTISKgS1/s
	=
X-Gm-Gg: ASbGncvWiQxV7cMI7583y7ZgBaPcmjOfCD6otXPEZV4U4+/tZwi7gg51rMlmDlQquBF
	Qch0SAsdobcondTUQdt1jTINZi5YkWLyM1Q7ojD4CSXJiwz5NY2yqRMT7jQlw+g3wKsXNNsin9n
	WXM505ioM3UYzmSpVF2+PehXNJFqcto7Cy/hUQil86ChjWlGf+ASLxUkhV8QIaQ5pI83W9eS8gr
	AB5r2W38BSqIbDhzgkkzMFvwKy9W8LE3XftLOiqY6QHn+0R
X-Google-Smtp-Source: AGHT+IHHu977g6/LM+We6XpD8KM5yUuS6smrcLLenUorK1eYp6MBuTmjyz9xoOwZleU2C/XmmQhAUw==
X-Received: by 2002:a05:620a:1711:b0:7b6:e8c3:4b5f with SMTP id af79cd13be357-7b6fbee8157mr167325785a.16.1734064309551;
        Thu, 12 Dec 2024 20:31:49 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6ed409c58sm214911785a.6.2024.12.12.20.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 20:31:48 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: Re: [PATCH] lib/fvp: add name to terminal title in FVP runner
Date: Thu, 12 Dec 2024 23:31:44 -0500
Message-Id: <173406430486.3607662.16438809333871380168.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209132529.619713-1-gabor.abonyi@arm.com>
References: <20241209132529.619713-1-gabor.abonyi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 04:32:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6285


On Mon, 09 Dec 2024 13:25:29 +0000, Gabor Abonyi wrote:
> Currently, terminal title is %title, which is populated with the
> component name by the FVP. This commit prepends it with {name},
> which is already a mandatory parameter for terminals to be launched.
> E.g. FVP_TERMINALS[terminal_uart] ?= "My Name" will launch a terminal
> with a title "My Name - terminal_uart".
> 
> 
> [...]

Applied, thanks!

[1/1] lib/fvp: add name to terminal title in FVP runner
      commit: b2c43dbf9b4e7c22038bdd5d01633962afe8f18f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

