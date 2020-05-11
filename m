Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.12996.1589207179550547015
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 07:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YQSRapJm;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id b18so524765ilf.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6sPncS/Z3i+2mKzeCbfjgTkxfrqb283llhpakzXysoc=;
        b=YQSRapJmGN+1AgZ/aTZbtC2g7wui6gHTVdY6VON1dxYdQO/OwacbljXOWfWgZOpzgc
         NiY23Z8FrWyXIXqQVl3FQc9Emn08K9pVI46KGPG2y9orTat7n7GAYtK1B798Xirlr8/X
         JCmudUgwv8hBwiIFcYm3McPXOGfJWWRERG0f3HBnw8vRHsachuK6Fm3L60s9yxety0DT
         /GicEQtB1mR9F1LPyJKJicUI9kcDFatDCNyItbQaciFOgZblDDHY9bUfj+FVLPoALWYV
         qi1REuu3ixRViBly788+u0OKS6KNKB6vrFKTaHTnJeMUl+9WsVPrP8+ASoI1deWcGuVw
         gJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6sPncS/Z3i+2mKzeCbfjgTkxfrqb283llhpakzXysoc=;
        b=XcNJzecVYn6RW+mjG/SzLQ2VT+DA32d7GUhpYMyDvfr3nnPGJAO35bQs3opW8PAObD
         vC0kFY4ZMbHz9tqYTZCQI3fX2igg0yokoGcBxoafQ1Zx84UBp6P6ZHzEqYjCSLvweGLh
         tTvHgsRriGig4cP3hsPyYLXquRWOnNSPy60dGse/jUeJ25BXHxO2J6BP11v7Eic8g9qe
         9XtSJGRn1S3C+rJbe3jrzVlpbbkpgaR291wGXJZP2beojBnvYTzsVSa6pY1InsQZu/kN
         tm+Hq0E1uMvKdbFmecCDPuZ3o543qk0M6RZlD5fNLBHijUIz1J170IrP1N8UFVR6Wwdv
         ajtA==
X-Gm-Message-State: AGi0PuaGU+sTg3OvsXIMJGGrLcj2XsTXJF0Fl6LWqj1BXzwfwZBnpvc/
	Rh/bzQ0+6T2YboKeeEx9rnp+CFZv
X-Google-Smtp-Source: APiQypI9LBJ8v+St03exNzYHUsekxAZUoFFduRGUqDyqLSXAl6fBS6g4vYvlMtZ5qwgUkcrh0gAzCQ==
X-Received: by 2002:a05:6e02:cd2:: with SMTP id c18mr17104143ilj.223.1589207178684;
        Mon, 11 May 2020 07:26:18 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:ac13:ea07:8c16:df2d])
        by smtp.gmail.com with ESMTPSA id a1sm5152256ilq.75.2020.05.11.07.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:26:17 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH 0/3] TF-A improvements
Date: Mon, 11 May 2020 09:26:01 -0500
Message-Id: <20200511142604.11860-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Makes several improvements to the TF-A recipe which should aid in it
being the canonical source of TF-A that other BSP layers can pull in
instead of replicating the recipe.

Joshua Watt (3):
  trusted-firmware-a: Build out of tree
  trusted-firmware-a: Install .elf file from subdirectory
  trusted-firmware-a: Add recipe for version 2.3

 .../trusted-firmware-a/trusted-firmware-a.inc | 31 ++++++++++---------
 .../trusted-firmware-a_2.3.bb                 | 25 +++++++++++++++
 2 files changed, 41 insertions(+), 15 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb

-- 
2.17.1

