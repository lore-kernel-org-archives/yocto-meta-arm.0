Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F383C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 12:57:38 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.7055.1749646651263400448
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 05:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=nKpeIBhd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso9697851cf.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Jun 2025 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1749646650; x=1750251450; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DKmmmSkO907zbUbuu3C1Ha9JWZNrI4gQcPqbV1XugY=;
        b=nKpeIBhdKi7ZPDKYb62fwF1LJwliLP0iw0K8EW80tbRmYgTKpYuCF9Su3DZSSY4Ybz
         AJBUb7tSvJODpQhiTfp4E+Zk9X92kfvGSlx6IUq8vThQGV8+LX3LDgUg/6SK3jNEx5J+
         6+MluiDkAMB+PDidq3GokLPENnIKGwShGGGReL89xACJdNaegiN0JBxfBhxFiJD7//qr
         HFPTDVX7Qw5k8rSKGl7l34/DUzdykOYeLacQ2ONc+80NAa4vpvqMXbfgJwhsbYOYAxvw
         6pasHv2hviyEbZnm5abU4RT6SdI5gxdeaaz5EAUxgL2EYvUmnO/bkgZOA2a1EMdoe8g+
         KiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646650; x=1750251450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DKmmmSkO907zbUbuu3C1Ha9JWZNrI4gQcPqbV1XugY=;
        b=C4LexrgEbY9nims3x5+G6tqTrPsGD7Ph59NhmnDmnlGhEv9Aj5dYaqMovXRqq0lyFx
         aEcQ/nIYiiHe4Gc+nKbL+cKfsyYFG5Y7SAKVaxuj1v378AO6mW8lVHIPBlcDnPgWcvAp
         xiNH680e6QgY1+bCIi3IIHp78OAGS+mdTtMJ2w10OIBRqlQ3ViDi4sHs/QoZUwO1wJI+
         tGozsoaKihd4UORkiEc5eLDZysRHhDt3VPn9WFY9EfdAU0J1kBtBop4bCjvewBKwk64n
         KEqT350AXqMpCRwqvDMvoWrx3m2hnRkDCewgUZjjF27UoiuFFJgjt4hYlpx14lTUQ+8c
         U2HQ==
X-Gm-Message-State: AOJu0YzkCXO9c2k2a5hNmWVI1kBV0Deg39mDISmWcxzyXby8v0gqyJ7G
	EuoIS/Bgq1cW+vsMikFYAuVZlpzZWn5GrGgWGv5sEn4Wi+5ZH2njzX9oubpjHL+xhgWDSVu1iyp
	GBBbwyw==
X-Gm-Gg: ASbGncuIiwHu/uaMqhkhrsTwR9C3J3qsjy5zK5YqwT0D5ProVqRjTdCCqClJhBJE2YP
	tLNeHK3PeN1yFLkn1zty/qoeKDBS9vLSSDifNbKHUQQSWG8WRwAwrlKEu8mlraoxH9xTPWggCX6
	la262FwLnRSSsM6N0SRoZ/a4ERfpib0qwUQgPboeZv7k+uE306wZ7FfT5c4OZJxO8wP9kCBekzt
	6OEKYxzA/Kzx/kRatRzOwYiP+bPXM2YsrHe8xQMg84/ffroWQf7UlYqQMk+MAU0xHSM3KPTUkCI
	c11YJOkoSxnZCpAMmK4fxDCTF/JcIWacX5VO4aUYkTkcGmcan6lrIA==
X-Google-Smtp-Source: AGHT+IG3pi3IU5fqpkpR8eZc8SYqFkyleyiKqBZBAvIJJlHf9dACgBYsCOzL2Z4XbqqpwPmnogei0A==
X-Received: by 2002:a05:622a:59cd:b0:4a6:f098:f7ab with SMTP id d75a77b69052e-4a713c3ac32mr54031001cf.4.1749646650129;
        Wed, 11 Jun 2025 05:57:30 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619852fc7sm87933261cf.37.2025.06.11.05.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:57:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/sbsa-acs: update to 7.2.2
Date: Wed, 11 Jun 2025 08:57:23 -0400
Message-Id: <174964664434.2418415.6544178795672794012.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610131115.17543-1-jon.mason@arm.com>
References: <20250610131115.17543-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Jun 2025 12:57:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6542


On Tue, 10 Jun 2025 09:11:15 -0400, Jon Mason wrote:
> Update to the latest version of SBSA ACS.  Since 7.1.4, BSA things were
> put in a separate git repo and it now has a dependency on that.
> 
> Also, address an issue with BSA, GCC15, and incompatible pointer type
> errors.
> 
> 
> [...]

Applied, thanks!

[1/1] arm/sbsa-acs: update to 7.2.2
      commit: 2705f2dc2d8fda242dd0b652d0af884baa7c5995

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

