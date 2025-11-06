Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F95CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 14:44:08 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17189.1762440245850625995
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 06:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=C+vJiDzx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88025eb208bso12137456d6.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 06:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1762440244; x=1763045044; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOv0nUNYhY+07I5ULgsOvO0HftSP6P7QenVpLJI26os=;
        b=C+vJiDzxGUdytAE8WUyz0KgOchXOaxXd2lhsKScputJlTttXR+tdF6OSIFXAeb+uEm
         Z552B/ewzClfgFq6iq+ihIrbZ+kTqr6Hrox2F5Gug7nDXP7ssVkQsLkFfLE8K71nPmY4
         HXD6b4ajKka5USwxujf/Z9kv60MTiIO0v0jT2tXD+MbncwkfV0IblHL+pZV5xVwxE6Tq
         h3yzvB7AuXEtqJDXBujgQtOJv/azyTPEgjw4x9hr0oJ/fQJMLYZbGDIkhJ2JUa9unqAg
         k7A7ajkG7/wazhDGMdPgBcIlhULR4dF/DB7eTED4+U5YpluD3Vr5CPSNBY8fbucsVy9/
         Eomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440244; x=1763045044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOv0nUNYhY+07I5ULgsOvO0HftSP6P7QenVpLJI26os=;
        b=kJCXL1aznDInG5PpwqWTi6t5YpF3AslAstbpyYhh26zqVir0f+w4UHvKUwFsQ9PTfE
         6QqNOWne0DMt3e06z8A15JZMAs6yL/Uc8W/fk0Dokqdbs956tBJQgeqtkkkoWPsDNd6U
         6fqoCppM1pgcHRyfZ/gAgaIuYVwGJuhaqLR0Gw0tTa7GCGnkGSxbYsNIztJSp1KcJETd
         CzpPtsflxJ+U2HmoqI66ViiFFqmqkSfiEHCPeXBGzSFGiOXw9pivHIEYW9XwYlGzDVzb
         n4t+MkEICwvP6hmbH1T+Twz4G9U2tP58N4N1zna1dhkrVSJuHSE6QgkhvXOI7U3rSRLS
         iwzw==
X-Gm-Message-State: AOJu0Yy+Hi0dlERBs6wXtsouId5QjIodsxUFYd194dFsSV0dNmsHOQB8
	oYyqmTaQOpNio+f8VTabjCR3I4Y1HMau98arShoVKxIbo4+bMpaFJeZAnf8ZutsldV3tCcg7aKv
	CKVA=
X-Gm-Gg: ASbGncsU6YDP0OadT8EoTK+st8fo9cyS6BsBMKTwnNDjzlirExz4yyRJ/haOAztvWry
	tUBggZwzoPddM3dGNpvIYCPcp7lbrNWszLlVJ8mlis2GDkfZz8V4XyIvtOYHdjQcQZd+RXMKMsi
	upixOPHJYlwHHCiWTk9QBHS3XYbzKnNieBdlECmeyShkoZqOvfXmbpMVzBlCWL/0/WDETTtqe+l
	NvjwBkYRj+Xyh+bYCiIXEy8dcmCBTpQnm7UHJngHHZdSeCtZTOLHIoT5HvTAwjQLpvbdZvoawkN
	xmPxAP9U7fQXfCdIoO+ACXX9T0GZFVwJ03xQYvnHfhTS+ypfO09Oqwxr+o5vpa/yFtp7UOrftsT
	7bdsoYLexFqfEq34A/bf9m5eI9Tjho5jXZfP3bvWUO+X2EtgvTiCgiCRAceui5gNhloQ=
X-Google-Smtp-Source: AGHT+IGUhWMfk2UxwTOkT3X+Kh7FHx+PIbP9qIIcPc+neaJ9Lc5p+0cMHY05/x9yTxXZZU/DbuMmAw==
X-Received: by 2002:a05:6214:c47:b0:880:580e:b3e5 with SMTP id 6a1803df08f44-88071170f7emr98794206d6.36.1762440244095;
        Thu, 06 Nov 2025 06:44:04 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8808290ca3csm20583086d6.25.2025.11.06.06.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:44:03 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: reduce coverage for time improvement
Date: Thu,  6 Nov 2025 09:43:51 -0500
Message-Id: <176244023313.1691764.2637424139116285770.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251031141933.77799-1-jon.mason@arm.com>
References: <20251031141933.77799-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 14:44:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6756


On Fri, 31 Oct 2025 10:19:33 -0400, Jon Mason wrote:
> Reduce the number of tests being run in CI to reduce the amount of time
> it takes to complete, while providing the same code coverage.  Internal
> CI runs went from 2.5h to 1.5h.
> 
> 

Applied, thanks!

[1/1] CI: reduce coverage for time improvement
      commit: 3bf5bc2a3cd002c8d318d913e1548f784e08d92d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

